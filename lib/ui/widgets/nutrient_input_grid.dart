import 'package:flutter/material.dart' hide Element;
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';

class NutrientInputGrid extends StatelessWidget {
  final Map<Element, double> targets;
  final ValueChanged<Map<Element, double>> onChanged;
  final CalculationResult? result;

  const NutrientInputGrid({
    super.key,
    required this.targets,
    required this.onChanged,
    this.result,
  });

  @override
  Widget build(BuildContext context) {
    final achieved = result?.achievedConcentrations ?? const {};
    final grossErrors = result?.grossErrors ?? const {};
    final instrumentalErrors = result?.instrumentalErrors ?? const {};

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Nutrientes Alvo',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 10,
            headingTextStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            columns: [
              const DataColumn(label: Text('Element')),
              const DataColumn(label: Text('Target'), numeric: true),
              if (achieved.isNotEmpty || grossErrors.isNotEmpty)
                const DataColumn(label: Text('Result'), numeric: true),
              if (grossErrors.isNotEmpty)
                const DataColumn(label: Text('GE%'), numeric: true),
              if (instrumentalErrors.isNotEmpty)
                const DataColumn(label: Text('IE%'), numeric: true),
            ],
            rows: Element.all.map((e) {
              final target = targets[e] ?? 0.0;
              final ach = achieved[e];
              final ge = grossErrors[e];
              final ie = instrumentalErrors[e];

              final cells = <DataCell>[
                DataCell(Text(
                  e.symbol,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
                DataCell(_targetCell(context, e, target)),
              ];

              if (achieved.isNotEmpty || grossErrors.isNotEmpty) {
                cells.add(DataCell(Text(
                  ach != null ? ach.toStringAsFixed(1) : '—',
                  style: Theme.of(context).textTheme.bodySmall,
                )));
              }
              if (grossErrors.isNotEmpty) {
                cells.add(DataCell(Text(
                  ge != null && ge > 0 ? '${ge.toStringAsFixed(1)}%' : '—',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ge != null && ge > 1.0
                            ? Theme.of(context).colorScheme.error
                            : null,
                      ),
                )));
              }
              if (instrumentalErrors.isNotEmpty) {
                cells.add(DataCell(Text(
                  ie != null && ie > 0 ? '${ie.toStringAsFixed(1)}%' : '—',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ie != null && ie > 20.0
                            ? Theme.of(context).colorScheme.error
                            : null,
                      ),
                )));
              }

              return DataRow(cells: cells);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _targetCell(BuildContext context, Element element, double value) {
    return SizedBox(
      width: 80,
      child: _NutrientField(
        value: value,
        onChanged: (newValue) {
          final newTargets = Map<Element, double>.from(targets);
          if (newValue == 0.0) {
            newTargets.remove(element);
          } else {
            newTargets[element] = newValue;
          }
          onChanged(newTargets);
        },
      ),
    );
  }
}

class _NutrientField extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _NutrientField({
    required this.value,
    required this.onChanged,
  });

  @override
  State<_NutrientField> createState() => _NutrientFieldState();
}

class _NutrientFieldState extends State<_NutrientField> {
  late final TextEditingController _controller;
  bool _internal = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _fmt(widget.value));
  }

  String _fmt(double v) => v == 0 ? '' : v.toStringAsFixed(1);

  @override
  void didUpdateWidget(_NutrientField old) {
    super.didUpdateWidget(old);
    if (!_internal && old.value != widget.value) {
      _controller.text = _fmt(widget.value);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        border: OutlineInputBorder(),
      ),
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (text) {
        _internal = true;
        widget.onChanged(double.tryParse(text) ?? 0.0);
        _internal = false;
      },
    );
  }
}
