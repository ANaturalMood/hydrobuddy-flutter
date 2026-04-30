import 'package:flutter/material.dart' hide Element;
import 'package:hydrobuddy/domain/models/element.dart';

class NutrientInputGrid extends StatelessWidget {
  final Map<Element, double> targets;
  final ValueChanged<Map<Element, double>> onChanged;

  const NutrientInputGrid({
    super.key,
    required this.targets,
    required this.onChanged,
  });

  static const _elements = [
    Element.nNo3,
    Element.nNh4,
    Element.p,
    Element.k,
    Element.mg,
    Element.ca,
    Element.s,
    Element.fe,
    Element.mn,
    Element.zn,
    Element.b,
    Element.cu,
    Element.si,
    Element.mo,
    Element.na,
    Element.cl,
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 600 ? 8 : 4;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1.3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: _elements.length,
          itemBuilder: (context, index) {
            final e = _elements[index];
            final value = targets[e] ?? 0.0;
            return _NutrientCell(
              element: e,
              value: value,
              onChanged: (v) {
                final newTargets = Map<Element, double>.from(targets);
                newTargets[e] = v;
                onChanged(newTargets);
              },
            );
          },
        );
      },
    );
  }
}

class _NutrientCell extends StatefulWidget {
  final Element element;
  final double value;
  final ValueChanged<double> onChanged;

  const _NutrientCell({
    required this.element,
    required this.value,
    required this.onChanged,
  });

  @override
  State<_NutrientCell> createState() => _NutrientCellState();
}

class _NutrientCellState extends State<_NutrientCell> {
  late TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _fmt(widget.value));
  }

  String _fmt(double v) => v == 0 ? '' : v.toString();

  @override
  void didUpdateWidget(_NutrientCell old) {
    super.didUpdateWidget(old);
    if (!_focusNode.hasFocus && old.value != widget.value) {
      _controller.text = _fmt(widget.value);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.element.symbol,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          height: 32,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerLow,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    BorderSide(color: theme.colorScheme.outlineVariant),
              ),
            ),
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            onChanged: (text) {
              widget.onChanged(double.tryParse(text) ?? 0.0);
            },
          ),
        ),
      ],
    );
  }
}
