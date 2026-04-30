import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InstrumentPrecisionScreen extends ConsumerStatefulWidget {
  const InstrumentPrecisionScreen({super.key});

  @override
  ConsumerState<InstrumentPrecisionScreen> createState() =>
      _InstrumentPrecisionScreenState();
}

class _InstrumentPrecisionScreenState
    extends ConsumerState<InstrumentPrecisionScreen> {
  final _volumeController = TextEditingController(text: '0.5');
  final _weightController = TextEditingController(text: '0.01');

  @override
  void dispose() {
    _volumeController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Precisão dos Instrumentos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Esses valores são usados para propagação de erro nos cálculos '
            'de incerteza das soluções preparadas.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _volumeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Erro do Volume (mL)',
              helperText: 'Incerteza da vidraria volumétrica',
              suffixText: 'mL',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Erro da Balança (g)',
              helperText: 'Incerteza da balança analítica',
              suffixText: 'g',
            ),
          ),
        ],
      ),
    );
  }
}
