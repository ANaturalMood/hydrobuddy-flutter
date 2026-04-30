import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';
import 'package:hydrobuddy/ui/widgets/nutrient_input_grid.dart';
import 'package:hydrobuddy/ui/widgets/results_grid.dart';
import 'package:hydrobuddy/ui/widgets/substance_selection_sheet.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(targetNutrientsProvider);
    final resultAsync = ref.watch(calculationResultProvider);
    final substanceIds = ref.watch(selectedSubstanceIdsProvider);

    final substanceNames = <int, String>{};
    for (final id in substanceIds) {
      final subAsync = ref.watch(substanceByIdProvider(id));
      substanceNames[id] = subAsync.valueOrNull?.name ?? '#$id';
    }

    final body = LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;
        if (isDesktop) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.40,
                child: _LeftPanel(resultAsync: resultAsync),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: _RightPanel(
                  resultAsync: resultAsync,
                  substanceNames: substanceNames,
                ),
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _LeftPanel(resultAsync: resultAsync),
                const SizedBox(height: 24),
                _RightPanel(
                  resultAsync: resultAsync,
                  substanceNames: substanceNames,
                ),
              ],
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('HydroBuddy')),
      body: body,
      bottomNavigationBar:
          _BottomActionBar(resultAsync: resultAsync),
    );
  }
}

// ========== Left Panel ==========

class _LeftPanel extends ConsumerWidget {
  final AsyncValue<CalculationResult> resultAsync;

  const _LeftPanel({required this.resultAsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targets = ref.watch(targetNutrientsProvider);
    final volume = ref.watch(volumeLitersProvider);
    final volumeUnit = ref.watch(volumeUnitProvider);
    final weightUnit = ref.watch(weightUnitProvider);
    final concUnit = ref.watch(concentrationUnitProvider);
    final calcMode = ref.watch(calculationModeProvider);
    final solutionMode = ref.watch(solutionModeProvider);
    final ecModel = ref.watch(ecModelProvider);
    final siSource = ref.watch(siSourceProvider);
    final dilutionFactor = ref.watch(dilutionFactorProvider);
    final dof = ref.watch(degreeOfFreedomProvider);
    final waterQualityId = ref.watch(waterQualityIdProvider);
    final weightError = ref.watch(weightErrorProvider);
    final volumeError = ref.watch(volumeErrorProvider);
    final substanceIds = ref.watch(selectedSubstanceIdsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _VolumeSection(
            volume: volume,
            volumeUnit: volumeUnit,
            onVolumeChanged: (v) =>
                ref.read(volumeLitersProvider.notifier).set(v),
            onUnitChanged: (v) =>
                ref.read(volumeUnitProvider.notifier).set(v),
          ),
          const SizedBox(height: 12),
          _UnitsSection(
            weightUnit: weightUnit,
            concUnit: concUnit,
            onWeightUnitChanged: (v) =>
                ref.read(weightUnitProvider.notifier).set(v),
            onConcUnitChanged: (v) =>
                ref.read(concentrationUnitProvider.notifier).set(v),
          ),
          const SizedBox(height: 12),
          _CalcModeSection(
            mode: calcMode,
            onChanged: (v) =>
                ref.read(calculationModeProvider.notifier).set(v),
          ),
          const SizedBox(height: 12),
          _SolutionModeSection(
            mode: solutionMode,
            factor: dilutionFactor,
            onModeChanged: (v) =>
                ref.read(solutionModeProvider.notifier).set(v),
            onFactorChanged: (v) =>
                ref.read(dilutionFactorProvider.notifier).set(v),
          ),
          const SizedBox(height: 12),
          _EcModelSection(
            model: ecModel,
            onChanged: (v) =>
                ref.read(ecModelProvider.notifier).set(v),
          ),
          const SizedBox(height: 12),
          _WaterQualitySection(selectedId: waterQualityId),
          const SizedBox(height: 12),
          _SubstancesSection(substanceIds: substanceIds),
          const SizedBox(height: 12),
          _DofSection(dof: dof),
          const SizedBox(height: 12),
          _InstrumentSection(
            volumeError: volumeError,
            weightError: weightError,
            onVolumeErrorChanged: (v) =>
                ref.read(volumeErrorProvider.notifier).set(v),
            onWeightErrorChanged: (v) =>
                ref.read(weightErrorProvider.notifier).set(v),
          ),
          const SizedBox(height: 12),
          _SiSourceSection(
            source: siSource,
            onChanged: (v) =>
                ref.read(siSourceProvider.notifier).set(v),
          ),
          const SizedBox(height: 12),
          NutrientInputGrid(
            targets: targets,
            onChanged: (v) =>
                ref.read(targetNutrientsProvider.notifier).set(v),
            result: resultAsync.valueOrNull,
          ),
        ],
      ),
    );
  }
}

// ========== Right Panel ==========

class _RightPanel extends ConsumerWidget {
  final AsyncValue<CalculationResult> resultAsync;
  final Map<int, String> substanceNames;

  const _RightPanel({
    required this.resultAsync,
    required this.substanceNames,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () =>
                  ref.invalidate(calculationResultProvider),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Carry Out Calculation'),
            ),
          ),
          const SizedBox(height: 16),
          resultAsync.when(
            data: (result) => ResultsGrid(
              result: result,
              substanceNames: substanceNames,
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => ResultsGrid(
              result: CalculationResult(
                substances: [],
                achievedConcentrations: {},
                targetConcentrations: {},
                totalCost: 0,
                predictedEc: 0,
                error: 'Erro: $err',
              ),
              substanceNames: substanceNames,
            ),
          ),
        ],
      ),
    );
  }
}

// ========== Bottom Action Bar ==========

class _BottomActionBar extends ConsumerWidget {
  final AsyncValue<CalculationResult> resultAsync;

  const _BottomActionBar({required this.resultAsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasResult = resultAsync.valueOrNull != null &&
        resultAsync.valueOrNull!.substances.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconButton(
              tooltip: '+5% Weights',
              icon: const Icon(Icons.add_circle_outline),
              onPressed: hasResult ? () {} : null,
            ),
            IconButton(
              tooltip: '-5% Weights',
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: hasResult ? () {} : null,
            ),
            const VerticalDivider(),
            TextButton.icon(
              icon: const Icon(Icons.save_outlined, size: 18),
              label: const Text('Save'),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.folder_open_outlined, size: 18),
              label: const Text('Load'),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.delete_outline, size: 18),
              label: const Text('Delete'),
              onPressed: null,
            ),
            const VerticalDivider(),
            TextButton.icon(
              icon: const Icon(Icons.table_chart_outlined, size: 18),
              label: const Text('CSV'),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.analytics_outlined, size: 18),
              label: const Text('Stock'),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.science_outlined, size: 18),
              label: const Text('Per Sub'),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.blender_outlined, size: 18),
              label: const Text('Mix'),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.pie_chart_outline, size: 18),
              label: const Text('Ratios'),
              onPressed: null,
            ),
            const VerticalDivider(),
            TextButton.icon(
              icon: const Icon(Icons.restart_alt, size: 18),
              label: const Text('Reset'),
              onPressed: () =>
                  ref.read(targetNutrientsProvider.notifier).set({}),
            ),
            TextButton.icon(
              icon: const Icon(Icons.copy, size: 18),
              label: const Text('Copy->Targets'),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.content_copy, size: 18),
              label: const Text('Copy->DB'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}

// ========== Section Widgets ==========

class _SectionCard extends StatelessWidget {
  final String label;
  final Widget child;

  const _SectionCard({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}

class _VolumeSection extends ConsumerStatefulWidget {
  final double volume;
  final calc.VolumeUnit volumeUnit;
  final ValueChanged<double> onVolumeChanged;
  final ValueChanged<calc.VolumeUnit> onUnitChanged;

  const _VolumeSection({
    required this.volume,
    required this.volumeUnit,
    required this.onVolumeChanged,
    required this.onUnitChanged,
  });

  @override
  ConsumerState<_VolumeSection> createState() => _VolumeSectionState();
}

class _VolumeSectionState extends ConsumerState<_VolumeSection> {
  late final TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(
      text: widget.volume == 0 ? '' : widget.volume.toStringAsFixed(1),
    );
  }

  @override
  void didUpdateWidget(_VolumeSection old) {
    super.didUpdateWidget(old);
    if (old.volume != widget.volume) {
      final newText =
          widget.volume == 0 ? '' : widget.volume.toStringAsFixed(1);
      if (_ctrl.text != newText) {
        _ctrl.text = newText;
      }
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      label: 'Volume',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: _ctrl,
              decoration: const InputDecoration(
                labelText: 'Volume',
                isDense: true,
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (v) {
                final parsed = double.tryParse(v);
                if (parsed != null && parsed >= 0) {
                  widget.onVolumeChanged(parsed);
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SegmentedButton<calc.VolumeUnit>(
              segments: const [
                ButtonSegment(value: calc.VolumeUnit.liter, label: Text('L')),
                ButtonSegment(
                    value: calc.VolumeUnit.gallon, label: Text('gal')),
              ],
              selected: {widget.volumeUnit},
              onSelectionChanged: (v) => widget.onUnitChanged(v.first),
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UnitsSection extends StatelessWidget {
  final calc.WeightUnit weightUnit;
  final calc.ConcUnit concUnit;
  final ValueChanged<calc.WeightUnit> onWeightUnitChanged;
  final ValueChanged<calc.ConcUnit> onConcUnitChanged;

  const _UnitsSection({
    required this.weightUnit,
    required this.concUnit,
    required this.onWeightUnitChanged,
    required this.onConcUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      label: 'Unidades',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 54, child: Text('Mass:')),
              Expanded(
                child: SegmentedButton<calc.WeightUnit>(
                  segments: const [
                    ButtonSegment(
                        value: calc.WeightUnit.gram, label: Text('g')),
                    ButtonSegment(
                        value: calc.WeightUnit.ounce, label: Text('oz')),
                  ],
                  selected: {weightUnit},
                  onSelectionChanged: (v) => onWeightUnitChanged(v.first),
                  style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 54, child: Text('Conc:')),
              Expanded(
                child: SegmentedButton<calc.ConcUnit>(
                  segments: const [
                    ButtonSegment(value: calc.ConcUnit.ppm, label: Text('ppm')),
                    ButtonSegment(value: calc.ConcUnit.mM, label: Text('mM')),
                    ButtonSegment(value: calc.ConcUnit.mN, label: Text('mN')),
                  ],
                  selected: {concUnit},
                  onSelectionChanged: (v) => onConcUnitChanged(v.first),
                  style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalcModeSection extends StatelessWidget {
  final calc.CalcMode mode;
  final ValueChanged<calc.CalcMode> onChanged;

  const _CalcModeSection({required this.mode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      label: 'Calc Mode',
      child: Column(
        children: [
          RadioListTile<calc.CalcMode>(
            value: calc.CalcMode.directAddition,
            groupValue: mode,
            title: const Text('Input Desired Concentrations'),
            contentPadding: EdgeInsets.zero,
            dense: true,
            onChanged: (v) {
              if (v != null) onChanged(v);
            },
          ),
          RadioListTile<calc.CalcMode>(
            value: calc.CalcMode.prepareStock,
            groupValue: mode,
            title: const Text('Concentrations from Weights'),
            contentPadding: EdgeInsets.zero,
            dense: true,
            onChanged: (v) {
              if (v != null) onChanged(v);
            },
          ),
        ],
      ),
    );
  }
}

class _SolutionModeSection extends StatelessWidget {
  final calc.SolutionMode mode;
  final double factor;
  final ValueChanged<calc.SolutionMode> onModeChanged;
  final ValueChanged<double> onFactorChanged;

  const _SolutionModeSection({
    required this.mode,
    required this.factor,
    required this.onModeChanged,
    required this.onFactorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      label: 'Solution Mode',
      child: Column(
        children: [
          RadioListTile<calc.SolutionMode>(
            value: calc.SolutionMode.directAddition,
            groupValue: mode,
            title: const Text('Direct addition'),
            contentPadding: EdgeInsets.zero,
            dense: true,
            onChanged: (v) {
              if (v != null) onModeChanged(v);
            },
          ),
          RadioListTile<calc.SolutionMode>(
            value: calc.SolutionMode.prepareStock,
            groupValue: mode,
            title: Row(
              children: [
                const Text('Concentrated A+B'),
                if (mode == calc.SolutionMode.prepareStock) ...[
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '100',
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        final f = double.tryParse(v);
                        if (f != null && f > 0) onFactorChanged(f);
                      },
                    ),
                  ),
                  const Text(' x'),
                ],
              ],
            ),
            contentPadding: EdgeInsets.zero,
            dense: true,
            onChanged: (v) {
              if (v != null) onModeChanged(v);
            },
          ),
        ],
      ),
    );
  }
}

class _EcModelSection extends StatelessWidget {
  final calc.EcModel model;
  final ValueChanged<calc.EcModel> onChanged;

  const _EcModelSection({required this.model, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      label: 'EC Model',
      child: Row(
        children: [
          Expanded(
            child: RadioListTile<calc.EcModel>(
              value: calc.EcModel.lmcv2,
              groupValue: model,
              title: const Text('LMCv2'),
              contentPadding: EdgeInsets.zero,
              dense: true,
              onChanged: (v) {
                if (v != null) onChanged(v);
              },
            ),
          ),
          Expanded(
            child: RadioListTile<calc.EcModel>(
              value: calc.EcModel.empirical,
              groupValue: model,
              title: const Text('Empirical'),
              contentPadding: EdgeInsets.zero,
              dense: true,
              onChanged: (v) {
                if (v != null) onChanged(v);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _WaterQualitySection extends ConsumerWidget {
  final int? selectedId;

  const _WaterQualitySection({required this.selectedId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waterQualitiesAsync = ref.watch(watchWaterQualitiesProvider);

    return _SectionCard(
      label: 'Water Quality',
      child: waterQualitiesAsync.when(
        data: (profiles) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<int>(
              value: selectedId,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Load water profile',
                isDense: true,
              ),
              items: [
                const DropdownMenuItem<int>(
                  value: null,
                  child: Text('None'),
                ),
                ...profiles.map((p) => DropdownMenuItem<int>(
                      value: p.id,
                      child: Text(p.name, overflow: TextOverflow.ellipsis),
                    )),
              ],
              onChanged: (v) =>
                  ref.read(waterQualityIdProvider.notifier).set(v),
            ),
            if (selectedId != null)
              CheckboxListTile(
                value: true,
                title: const Text('Apply to calculation'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: (v) {
                  if (v == false) {
                    ref.read(waterQualityIdProvider.notifier).set(null);
                  }
                },
              ),
          ],
        ),
        loading: () => const LinearProgressIndicator(),
        error: (e, _) => Text('Error: $e'),
      ),
    );
  }
}

class _SubstancesSection extends ConsumerWidget {
  final List<int> substanceIds;

  const _SubstancesSection({required this.substanceIds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = <int, String>{};
    for (final id in substanceIds) {
      final subAsync = ref.watch(substanceByIdProvider(id));
      names[id] = subAsync.valueOrNull?.name ?? '#$id';
    }

    return _SectionCard(
      label: 'Substances',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (substanceIds.isEmpty)
            Text(
              'No substances selected',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            )
          else ...[
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: substanceIds.map((id) {
                return Chip(
                  label: Text(names[id] ?? '#$id',
                      style: const TextStyle(fontSize: 12)),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () {
                    final newIds = List<int>.from(substanceIds)..remove(id);
                    ref
                        .read(selectedSubstanceIdsProvider.notifier)
                        .set(newIds);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                );
              }).toList(),
            ),
            const SizedBox(height: 4),
            Text(
              '${substanceIds.length} selected',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => _openSheet(context, ref),
            icon: const Icon(Icons.science, size: 18),
            label: const Text('Select Substances'),
          ),
        ],
      ),
    );
  }

  void _openSheet(BuildContext context, WidgetRef ref) async {
    final result = await showModalBottomSheet<List<int>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      builder: (_) => const SubstanceSelectionSheet(),
    );
    if (result != null) {
      ref.read(selectedSubstanceIdsProvider.notifier).set(result);
    }
  }
}

class _DofSection extends ConsumerWidget {
  final Element? dof;

  const _DofSection({required this.dof});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SectionCard(
      label: 'Free element (DOF)',
      child: DropdownButtonFormField<Element>(
        value: dof,
        isExpanded: true,
        decoration: const InputDecoration(
          labelText: 'Degree of freedom',
          isDense: true,
        ),
        items: [
          const DropdownMenuItem<Element>(
            value: null,
            child: Text('None'),
          ),
          ...Element.all.map((e) => DropdownMenuItem<Element>(
                value: e,
                child: Text('${e.symbol} — ${e.displayName}'),
              )),
        ],
        onChanged: (v) =>
            ref.read(degreeOfFreedomProvider.notifier).set(v),
      ),
    );
  }
}

class _InstrumentSection extends ConsumerStatefulWidget {
  final double volumeError;
  final double weightError;
  final ValueChanged<double> onVolumeErrorChanged;
  final ValueChanged<double> onWeightErrorChanged;

  const _InstrumentSection({
    required this.volumeError,
    required this.weightError,
    required this.onVolumeErrorChanged,
    required this.onWeightErrorChanged,
  });

  @override
  ConsumerState<_InstrumentSection> createState() => _InstrumentSectionState();
}

class _InstrumentSectionState extends ConsumerState<_InstrumentSection> {
  late final TextEditingController _volCtrl;
  late final TextEditingController _wtCtrl;

  @override
  void initState() {
    super.initState();
    _volCtrl = TextEditingController(text: widget.volumeError.toStringAsFixed(2));
    _wtCtrl = TextEditingController(text: widget.weightError.toStringAsFixed(2));
  }

  @override
  void didUpdateWidget(_InstrumentSection old) {
    super.didUpdateWidget(old);
    if (old.volumeError != widget.volumeError) {
      _volCtrl.text = widget.volumeError.toStringAsFixed(2);
    }
    if (old.weightError != widget.weightError) {
      _wtCtrl.text = widget.weightError.toStringAsFixed(2);
    }
  }

  @override
  void dispose() {
    _volCtrl.dispose();
    _wtCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      label: 'Instrument Precision',
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _volCtrl,
              decoration: const InputDecoration(
                labelText: 'Vol err (\u00B1L)',
                isDense: true,
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (v) {
                final p = double.tryParse(v);
                if (p != null && p >= 0) widget.onVolumeErrorChanged(p);
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _wtCtrl,
              decoration: const InputDecoration(
                labelText: 'Wt err (\u00B1g)',
                isDense: true,
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (v) {
                final p = double.tryParse(v);
                if (p != null && p >= 0) widget.onWeightErrorChanged(p);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SiSourceSection extends StatelessWidget {
  final calc.SiSource source;
  final ValueChanged<calc.SiSource> onChanged;

  const _SiSourceSection({required this.source, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      label: 'Si source',
      child: SegmentedButton<calc.SiSource>(
        segments: const [
          ButtonSegment(value: calc.SiSource.si, label: Text('Si')),
          ButtonSegment(value: calc.SiSource.sio2, label: Text('SiO\u2082')),
        ],
        selected: {source},
        onSelectionChanged: (v) => onChanged(v.first),
        style: const ButtonStyle(
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
