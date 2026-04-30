import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/ui/widgets/nutrient_input_grid.dart';

class CalculatorScreen extends ConsumerStatefulWidget {
  const CalculatorScreen({super.key});

  @override
  ConsumerState<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends ConsumerState<CalculatorScreen> {
  late TextEditingController _volumeCtrl;
  late TextEditingController _concFactorCtrl;
  bool _saltAccordionOpen = true;

  @override
  void initState() {
    super.initState();
    _volumeCtrl = TextEditingController(
      text: ref.read(volumeLitersProvider).toStringAsFixed(1),
    );
    _concFactorCtrl = TextEditingController(
      text: ref.read(dilutionFactorProvider).toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _volumeCtrl.dispose();
    _concFactorCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 72,
              bottom: 120,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _FormulationLoader(colorScheme: colorScheme, theme: theme),
                const SizedBox(height: 16),
                _ModeToggle(colorScheme: colorScheme, theme: theme),
                const SizedBox(height: 16),
                _SystemParameters(
                  colorScheme: colorScheme,
                  theme: theme,
                  volumeCtrl: _volumeCtrl,
                  concFactorCtrl: _concFactorCtrl,
                ),
                const SizedBox(height: 16),
                _TargetConcentrationsSection(
                  colorScheme: colorScheme,
                  theme: theme,
                ),
                const SizedBox(height: 16),
                _SaltSelectionSection(
                  colorScheme: colorScheme,
                  theme: theme,
                  open: _saltAccordionOpen,
                  onToggle: () =>
                      setState(() => _saltAccordionOpen = !_saltAccordionOpen),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  bottom: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.science, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'HydroBuddy',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.notifications_outlined,
                        color: colorScheme.onSurfaceVariant),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text(
                      'JD',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 200,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ref.invalidate(calculationResultProvider);
                    context.go('/results');
                  },
                  icon: const Icon(Icons.calculate, size: 22),
                  label: const Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                    elevation: 8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormulationLoader extends StatelessWidget {
  final ColorScheme colorScheme;
  final ThemeData theme;

  const _FormulationLoader({
    required this.colorScheme,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LOAD EXISTING FORMULATION',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              hintText: 'Select a recipe...',
              filled: true,
              fillColor: colorScheme.surfaceContainerLow,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.outlineVariant),
              ),
              suffixIcon: Icon(Icons.expand_more,
                  color: colorScheme.onSurfaceVariant),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
            items: const [
              DropdownMenuItem(
                  value: null, child: Text('Select a recipe...')),
              DropdownMenuItem(
                  value: 'gh',
                  child: Text('General Hydroponics FloraSeries')),
              DropdownMenuItem(
                  value: 'mb', child: Text('Masterblend Tomato Formula')),
              DropdownMenuItem(
                  value: 'cl', child: Text('Custom Lettuce Mix 2024')),
            ],
            onChanged: (v) {},
          ),
        ],
      ),
    );
  }
}

class _ModeToggle extends ConsumerWidget {
  final ColorScheme colorScheme;
  final ThemeData theme;

  const _ModeToggle({required this.colorScheme, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(calculationModeProvider);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => ref
                  .read(calculationModeProvider.notifier)
                  .set(calc.CalcMode.directAddition),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: mode == calc.CalcMode.directAddition
                      ? colorScheme.surface
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                      boxShadow: mode == calc.CalcMode.directAddition
                      ? [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4)
                        ]
                      : null,
                ),
                child: Text(
                  'Input Desired',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: mode == calc.CalcMode.directAddition
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => ref
                  .read(calculationModeProvider.notifier)
                  .set(calc.CalcMode.prepareStock),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: mode == calc.CalcMode.prepareStock
                      ? colorScheme.surface
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                      boxShadow: mode == calc.CalcMode.prepareStock
                      ? [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4)
                        ]
                      : null,
                ),
                child: Text(
                  'From Weights',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: mode == calc.CalcMode.prepareStock
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SystemParameters extends ConsumerStatefulWidget {
  final ColorScheme colorScheme;
  final ThemeData theme;
  final TextEditingController volumeCtrl;
  final TextEditingController concFactorCtrl;

  const _SystemParameters({
    required this.colorScheme,
    required this.theme,
    required this.volumeCtrl,
    required this.concFactorCtrl,
  });

  @override
  ConsumerState<_SystemParameters> createState() => _SystemParametersState();
}

class _SystemParametersState extends ConsumerState<_SystemParameters> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final solutionMode = ref.watch(solutionModeProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.settings_input_component,
                  size: 20, color: widget.colorScheme.primary),
              const SizedBox(width: 8),
              Text('System Parameters',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.colorScheme.onSurface)),
            ],
          ),
          const SizedBox(height: 12),
          _ParamLabel(text: 'VOLUME (L)', colorScheme: widget.colorScheme),
          const SizedBox(height: 4),
          SizedBox(
            height: 40,
            child: TextField(
              controller: widget.volumeCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: _inputDecoration(widget.colorScheme),
              onChanged: (v) {
                final p = double.tryParse(v);
                if (p != null && p >= 0) {
                  ref.read(volumeLitersProvider.notifier).set(p);
                }
              },
            ),
          ),
          const SizedBox(height: 12),
          _ParamLabel(
              text: 'PREPARATION TYPE', colorScheme: widget.colorScheme),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: _PrepTypeButton(
                  label: 'Direct',
                  icon: Icons.water_drop,
                  selected:
                      solutionMode == calc.SolutionMode.directAddition,
                  colorScheme: widget.colorScheme,
                  onTap: () => ref
                      .read(solutionModeProvider.notifier)
                      .set(calc.SolutionMode.directAddition),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _PrepTypeButton(
                  label: 'A+B',
                  icon: Icons.science,
                  selected:
                      solutionMode == calc.SolutionMode.prepareStock,
                  colorScheme: widget.colorScheme,
                  onTap: () => ref
                      .read(solutionModeProvider.notifier)
                      .set(calc.SolutionMode.prepareStock),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ParamLabel(
              text: 'CONCENTRATION FACTOR', colorScheme: widget.colorScheme),
          const SizedBox(height: 4),
          SizedBox(
            height: 40,
            child: TextField(
              controller: widget.concFactorCtrl,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration(widget.colorScheme).copyWith(
                suffixText: 'x',
                suffixStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.colorScheme.onSurfaceVariant,
                ),
              ),
              onChanged: (v) {
                final p = double.tryParse(v);
                if (p != null && p > 0) {
                  ref.read(dilutionFactorProvider.notifier).set(p);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(ColorScheme cs) {
    return InputDecoration(
      filled: true,
      fillColor: cs.surfaceContainerLow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: cs.outlineVariant),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      isDense: true,
    );
  }
}

class _ParamLabel extends StatelessWidget {
  final String text;
  final ColorScheme colorScheme;

  const _ParamLabel({required this.text, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _PrepTypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final ColorScheme colorScheme;
  final VoidCallback onTap;

  const _PrepTypeButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.colorScheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? colorScheme.primaryContainer.withValues(alpha: 0.1)
              : Colors.transparent,
          border: Border.all(
            color: selected
                ? colorScheme.primary
                : colorScheme.outlineVariant,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: selected ? colorScheme.primary : colorScheme.onSurfaceVariant),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: selected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TargetConcentrationsSection extends ConsumerWidget {
  final ColorScheme colorScheme;
  final ThemeData theme;

  const _TargetConcentrationsSection({
    required this.colorScheme,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targets = ref.watch(targetNutrientsProvider);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.track_changes,
                    size: 20, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Target Concentrations (ppm)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.all(12),
            child: NutrientInputGrid(
              targets: targets,
              onChanged: (v) =>
                  ref.read(targetNutrientsProvider.notifier).set(v),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.save_as, size: 16, color: colorScheme.secondary),
                label: Text(
                  'Save Formulation',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SaltSelectionSection extends ConsumerWidget {
  final ColorScheme colorScheme;
  final ThemeData theme;
  final bool open;
  final VoidCallback onToggle;

  const _SaltSelectionSection({
    required this.colorScheme,
    required this.theme,
    required this.open,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIds = ref.watch(selectedSubstanceIdsProvider);
    final substancesAsync = ref.watch(watchSubstancesProvider);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.biotech,
                      size: 20, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Salt Selection',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      substancesAsync.whenData((substances) {
                        final allIds =
                            substances.map((s) => s.id).toList();
                        if (selectedIds.length == substances.length) {
                          ref
                              .read(selectedSubstanceIdsProvider.notifier)
                              .set([]);
                        } else {
                          ref
                              .read(selectedSubstanceIdsProvider.notifier)
                              .set(allIds);
                        }
                      });
                    },
                    child: Text(
                      'Select All',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: open ? 0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.expand_more,
                        color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: substancesAsync.when(
              data: (substances) => _SaltTable(
                colorScheme: colorScheme,
                substances: substances,
                selectedIds: selectedIds,
              ),
              loading: () => const SizedBox(
                height: 48,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Error: $e'),
              ),
            ),
            crossFadeState: open
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}

class _SaltTable extends ConsumerWidget {
  final ColorScheme colorScheme;
  final List<Substance> substances;
  final List<int> selectedIds;

  const _SaltTable({
    required this.colorScheme,
    required this.substances,
    required this.selectedIds,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  color: colorScheme.secondary,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 36,
                        child: Text(
                          'INC',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'CHEMICAL',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'FORMULA',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 52,
                        child: Text(
                          'PURITY',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...substances.map((sub) => _SaltRow(
                      colorScheme: colorScheme,
                      substance: sub,
                      checked: selectedIds.contains(sub.id),
                      onToggle: () {
                        final ids =
                            List<int>.from(selectedIds);
                        if (ids.contains(sub.id)) {
                          ids.remove(sub.id);
                        } else {
                          ids.add(sub.id);
                        }
                        ref
                            .read(selectedSubstanceIdsProvider.notifier)
                            .set(ids);
                      },
                    )),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
          ),
          child: Center(
            child: TextButton.icon(
              onPressed: () => context.push('/substances/new'),
              icon: Icon(Icons.add_circle,
                  size: 16, color: colorScheme.primary),
              label: Text(
                'Add Custom Salt',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SaltRow extends StatelessWidget {
  final ColorScheme colorScheme;
  final Substance substance;
  final bool checked;
  final VoidCallback onToggle;

  const _SaltRow({
    required this.colorScheme,
    required this.substance,
    required this.checked,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom:             BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              child: Checkbox(
                value: checked,
                onChanged: (_) => onToggle(),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                substance.name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            Expanded(
              child: Text(
                substance.formula ?? '',
                style: TextStyle(
                  fontSize: 10,
                  color: colorScheme.onSurfaceVariant,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            SizedBox(
              width: 52,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiaryFixed,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${(substance.purity * 100).round()}%',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onTertiaryFixed,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
