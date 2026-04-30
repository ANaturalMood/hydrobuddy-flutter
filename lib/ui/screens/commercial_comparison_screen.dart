import 'package:flutter/material.dart';

class CommercialComparisonScreen extends StatefulWidget {
  const CommercialComparisonScreen({super.key});

  @override
  State<CommercialComparisonScreen> createState() =>
      _CommercialComparisonScreenState();
}

class _CommercialComparisonScreenState
    extends State<CommercialComparisonScreen> {
  final _name1Ctrl = TextEditingController();
  final _npk1Ctrl = TextEditingController();
  final _weight1Ctrl = TextEditingController();
  final _volume1Ctrl = TextEditingController();

  final _name2Ctrl = TextEditingController();
  final _npk2Ctrl = TextEditingController();
  final _weight2Ctrl = TextEditingController();
  final _volume2Ctrl = TextEditingController();

  Map<String, Map<String, double>>? _results;

  @override
  void dispose() {
    _name1Ctrl.dispose();
    _npk1Ctrl.dispose();
    _weight1Ctrl.dispose();
    _volume1Ctrl.dispose();
    _name2Ctrl.dispose();
    _npk2Ctrl.dispose();
    _weight2Ctrl.dispose();
    _volume2Ctrl.dispose();
    super.dispose();
  }

  Map<String, double>? _parseNpk(String npk, double weight, double volume) {
    if (npk.isEmpty || weight <= 0 || volume <= 0) return null;
    final parts = npk.split('-');
    if (parts.length != 3) return null;
    final n = double.tryParse(parts[0]);
    final p = double.tryParse(parts[1]);
    final k = double.tryParse(parts[2]);
    if (n == null || p == null || k == null) return null;

    final nPpm = n / 100 * weight * 1000 / volume;
    final p2o5Ppm = p / 100 * weight * 1000 / volume;
    final pPpm = p2o5Ppm * 0.436;
    final k2oPpm = k / 100 * weight * 1000 / volume;
    final kPpm = k2oPpm * 0.83;

    return {
      'N': nPpm,
      'P₂O₅': p2o5Ppm,
      'P': pPpm,
      'K₂O': k2oPpm,
      'K': kPpm,
    };
  }

  void _compare() {
    final w1 = double.tryParse(_weight1Ctrl.text);
    final v1 = double.tryParse(_volume1Ctrl.text);
    final w2 = double.tryParse(_weight2Ctrl.text);
    final v2 = double.tryParse(_volume2Ctrl.text);

    if (w1 == null || v1 == null || w2 == null || v2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos com valores válidos')),
      );
      return;
    }

    final r1 = _parseNpk(_npk1Ctrl.text.trim(), w1, v1);
    final r2 = _parseNpk(_npk2Ctrl.text.trim(), w2, v2);

    if (r1 == null || r2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verifique os valores NPK de ambos os fertilizantes')),
      );
      return;
    }

    setState(() {
      _results = {
        _name1Ctrl.text.trim().isEmpty ? 'Fertilizante 1' : _name1Ctrl.text.trim(): r1,
        _name2Ctrl.text.trim().isEmpty ? 'Fertilizante 2' : _name2Ctrl.text.trim(): r2,
      };
    });
  }

  Widget _buildColumn(String label, TextEditingController nameCtrl,
      TextEditingController npkCtrl, TextEditingController weightCtrl,
      TextEditingController volumeCtrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: nameCtrl,
          decoration: const InputDecoration(labelText: 'Nome', isDense: true),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: npkCtrl,
          decoration: const InputDecoration(
            labelText: 'NPK',
            hintText: '10-10-10',
            isDense: true,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: weightCtrl,
          decoration: const InputDecoration(
            labelText: 'Massa (g)',
            isDense: true,
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: volumeCtrl,
          decoration: const InputDecoration(
            labelText: 'Volume (L)',
            isDense: true,
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comparar Fertilizantes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildColumn(
                    'Fertilizante 1',
                    _name1Ctrl,
                    _npk1Ctrl,
                    _weight1Ctrl,
                    _volume1Ctrl,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildColumn(
                    'Fertilizante 2',
                    _name2Ctrl,
                    _npk2Ctrl,
                    _weight2Ctrl,
                    _volume2Ctrl,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _compare,
              child: const Text('Comparar'),
            ),
            if (_results != null) ...[
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Resultado (ppm)',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      DataTable(
                        columns: [
                          const DataColumn(label: Text('Elemento')),
                          ..._results!.keys.map(
                              (k) => DataColumn(label: Text(k))),
                          const DataColumn(label: Text('Diferença')),
                        ],
                        rows: [
                          'N',
                          'P₂O₅',
                          'P',
                          'K₂O',
                          'K',
                        ].map((elem) {
                          final entries = _results!.entries.toList();
                          final v1 = entries[0].value[elem] ?? 0;
                          final v2 = entries[1].value[elem] ?? 0;
                          final diff = (v1 - v2).abs();
                          return DataRow(cells: [
                            DataCell(Text(elem)),
                            DataCell(Text(v1.toStringAsFixed(2))),
                            DataCell(Text(v2.toStringAsFixed(2))),
                            DataCell(Text(diff.toStringAsFixed(2))),
                          ]);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
