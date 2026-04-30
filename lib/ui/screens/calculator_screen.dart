import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/calculation_input.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart' hide VolumeUnit;
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/ui/widgets/nutrient_input_grid.dart';
import 'package:hydrobuddy/ui/widgets/results_grid.dart';

/// Tela principal da calculadora hidropônica com layout adaptativo.
///
/// Desktop (width > 900): Row com painel de inputs à esquerda (40%),
///   resultados à direita (60%).
/// Tablet/Mobile (width <= 900): Column com scroll vertical.
class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targets = ref.watch(targetNutrientsProvider);
    final resultAsync = ref.watch(calculationResultProvider);
    final substanceIds = ref.watch(selectedSubstanceIdsProvider);
    final volume = ref.watch(volumeLitersProvider);
    final volumeUnit = ref.watch(volumeUnitProvider);

    // Resolve nomes das substâncias selecionadas
    final substanceNames = <int, String>{};
    for (final id in substanceIds) {
      final subAsync = ref.watch(substanceByIdProvider(id));
      substanceNames[id] = subAsync.valueOrNull?.name ?? 'Substância $id';
    }

    final body = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.40,
                child: _InputsPanel(
                  targets: targets,
                  volume: volume,
                  volumeUnit: volumeUnit,
                  onTargetsChanged: (v) =>
                      ref.read(targetNutrientsProvider.notifier).set(v),
                  onVolumeChanged: (v) =>
                      ref.read(volumeLitersProvider.notifier).set(v),
                  onVolumeUnitChanged: (v) =>
                      ref.read(volumeUnitProvider.notifier).set(v),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: _ResultsPanel(
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
                _InputsPanel(
                  targets: targets,
                  volume: volume,
                  volumeUnit: volumeUnit,
                  onTargetsChanged: (v) =>
                      ref.read(targetNutrientsProvider.notifier).set(v),
                  onVolumeChanged: (v) =>
                      ref.read(volumeLitersProvider.notifier).set(v),
                  onVolumeUnitChanged: (v) =>
                      ref.read(volumeUnitProvider.notifier).set(v),
                ),
                const SizedBox(height: 24),
                _ResultsPanel(
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
    );
  }
}

// ========== Painel de Inputs ==========

class _InputsPanel extends StatelessWidget {
  final Map<Element, double> targets;
  final double volume;
  final VolumeUnit volumeUnit;
  final ValueChanged<Map<Element, double>> onTargetsChanged;
  final ValueChanged<double> onVolumeChanged;
  final ValueChanged<VolumeUnit> onVolumeUnitChanged;

  const _InputsPanel({
    required this.targets,
    required this.volume,
    required this.volumeUnit,
    required this.onTargetsChanged,
    required this.onVolumeChanged,
    required this.onVolumeUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Volume e Unidades',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _VolumeRow(
            volume: volume,
            volumeUnit: volumeUnit,
            onVolumeChanged: onVolumeChanged,
            onVolumeUnitChanged: onVolumeUnitChanged,
          ),
          const SizedBox(height: 16),
          Text(
            'Nutrientes Alvo',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          NutrientInputGrid(
            targets: targets,
            onChanged: onTargetsChanged,
          ),
        ],
      ),
    );
  }
}

// ========== Linha Volume + Unidade ==========

class _VolumeRow extends StatefulWidget {
  final double volume;
  final VolumeUnit volumeUnit;
  final ValueChanged<double> onVolumeChanged;
  final ValueChanged<VolumeUnit> onVolumeUnitChanged;

  const _VolumeRow({
    required this.volume,
    required this.volumeUnit,
    required this.onVolumeChanged,
    required this.onVolumeUnitChanged,
  });

  @override
  State<_VolumeRow> createState() => _VolumeRowState();
}

class _VolumeRowState extends State<_VolumeRow> {
  late final TextEditingController _volumeCtrl;
  bool _internal = false;

  @override
  void initState() {
    super.initState();
    _volumeCtrl =
        TextEditingController(text: _fmt(widget.volume));
  }

  String _fmt(double v) => v == 0 ? '' : v.toStringAsFixed(1);

  @override
  void didUpdateWidget(_VolumeRow old) {
    super.didUpdateWidget(old);
    if (!_internal && old.volume != widget.volume) {
      _volumeCtrl.text = _fmt(widget.volume);
    }
  }

  @override
  void dispose() {
    _volumeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            controller: _volumeCtrl,
            decoration: const InputDecoration(labelText: 'Volume'),
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            onChanged: (text) {
              final v = double.tryParse(text);
              if (v != null && v > 0) {
                _internal = true;
                widget.onVolumeChanged(v);
                _internal = false;
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: DropdownButtonFormField<String>(
            value: widget.volumeUnit.name,
            decoration: const InputDecoration(labelText: 'Unidade'),
            items: const [
              DropdownMenuItem(value: 'liter', child: Text('L')),
              DropdownMenuItem(value: 'gallon', child: Text('gal')),
            ],
            onChanged: (v) {
              if (v == 'gallon') {
                widget.onVolumeUnitChanged(VolumeUnit.gallon);
              } else {
                widget.onVolumeUnitChanged(VolumeUnit.liter);
              }
            },
          ),
        ),
      ],
    );
  }
}

// ========== Painel de Resultados ==========

class _ResultsPanel extends StatelessWidget {
  final AsyncValue<CalculationResult> resultAsync;
  final Map<int, String> substanceNames;

  const _ResultsPanel({
    required this.resultAsync,
    required this.substanceNames,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: resultAsync.when(
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
            error: 'Erro ao calcular: $err',
          ),
          substanceNames: substanceNames,
        ),
      ),
    );
  }
}
