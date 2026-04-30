import 'package:flutter/material.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({super.key});

  @override
  State<CommercialScreen> createState() => _CommercialScreenState();
}

class _CommercialScreenState extends State<CommercialScreen> {
  final _npkCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _volumeCtrl = TextEditingController();
  Map<String, double>? _ppm;

  @override
  void dispose() {
    _npkCtrl.dispose();
    _weightCtrl.dispose();
    _volumeCtrl.dispose();
    super.dispose();
  }

  void _calculate() {
    final npkText = _npkCtrl.text.trim();
    final weight = double.tryParse(_weightCtrl.text);
    final volume = double.tryParse(_volumeCtrl.text);

    if (npkText.isEmpty || weight == null || volume == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.fillAllFieldsValid)),
      );
      return;
    }

    final parts = npkText.split('-');
    if (parts.length != 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.invalidNpkFormat)),
      );
      return;
    }

    final nPercent = double.tryParse(parts[0]);
    final pPercent = double.tryParse(parts[1]);
    final kPercent = double.tryParse(parts[2]);

    if (nPercent == null || pPercent == null || kPercent == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.invalidNpkValues)),
      );
      return;
    }

    if (volume <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.volumeMustBePositive)),
      );
      return;
    }

    final nPpm = nPercent / 100 * weight * 1000 / volume;
    final p2o5Ppm = pPercent / 100 * weight * 1000 / volume;
    final pPpm = p2o5Ppm * 0.436;
    final k2oPpm = kPercent / 100 * weight * 1000 / volume;
    final kPpm = k2oPpm * 0.83;

    setState(() {
      _ppm = {
        'N (ppm)': nPpm,
        'P₂O₅ (ppm)': p2o5Ppm,
        'P (ppm)': pPpm,
        'K₂O (ppm)': k2oPpm,
        'K (ppm)': kPpm,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.commercialFertilizer)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _npkCtrl,
              decoration: const InputDecoration(
                labelText: 'NPK',
                hintText: 'Ex: 10-10-10',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _weightCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.massG,
                suffixText: 'g',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _volumeCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.volume,
                suffixText: 'L',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _calculate,
              child: Text(AppLocalizations.of(context)!.calculate),
            ),
            if (_ppm != null) ...[
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text(AppLocalizations.of(context)!.element)),
                      const DataColumn(label: Text('ppm')),
                    ],
                    rows: _ppm!.entries
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.key)),
                              DataCell(Text(e.value.toStringAsFixed(2))),
                            ]))
                        .toList(),
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
