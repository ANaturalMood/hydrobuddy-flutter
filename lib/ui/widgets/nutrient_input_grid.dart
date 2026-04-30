import 'package:flutter/material.dart' hide Element;
import 'package:hydrobuddy/domain/models/element.dart';

/// Grid de 16 inputs numéricos de nutrientes (2 colunas × 8 linhas).
/// Recebe [targets] e notifica [onChanged] quando o usuário edita um valor.
class NutrientInputGrid extends StatelessWidget {
  final Map<Element, double> targets;
  final ValueChanged<Map<Element, double>> onChanged;

  const NutrientInputGrid({
    super.key,
    required this.targets,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 6,
      ),
      itemCount: Element.all.length,
      itemBuilder: (context, index) {
        final element = Element.all[index];
        return _NutrientField(
          label: element.symbol,
          value: targets[element] ?? 0.0,
          onChanged: (newValue) {
            final newTargets = Map<Element, double>.from(targets);
            if (newValue == 0.0) {
              newTargets.remove(element);
            } else {
              newTargets[element] = newValue;
            }
            onChanged(newTargets);
          },
        );
      },
    );
  }
}

class _NutrientField extends StatefulWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const _NutrientField({
    required this.label,
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
    return Row(
      children: [
        SizedBox(
          width: 56,
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            ),
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            onChanged: (text) {
              _internal = true;
              widget.onChanged(double.tryParse(text) ?? 0.0);
              _internal = false;
            },
          ),
        ),
      ],
    );
  }
}
