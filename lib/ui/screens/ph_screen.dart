import 'package:flutter/material.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';

class PhScreen extends StatefulWidget {
  const PhScreen({super.key});

  @override
  State<PhScreen> createState() => _PhScreenState();
}

class _PhScreenState extends State<PhScreen> {
  final _currentPhCtrl = TextEditingController();
  final _targetPhCtrl = TextEditingController();
  final _volumeCtrl = TextEditingController();
  String _selectedAcid = 'phosphoric';
  String? _result;

  static const _acids = {
    'phosphoric': 'Ácido Fosfórico (H₃PO₄)',
    'nitric': 'Ácido Nítrico (HNO₃)',
    'sulfuric': 'Ácido Sulfúrico (H₂SO₄)',
  };

  static const _factors = {
    'phosphoric': 0.5,
    'nitric': 0.3,
    'sulfuric': 0.2,
  };

  @override
  void dispose() {
    _currentPhCtrl.dispose();
    _targetPhCtrl.dispose();
    _volumeCtrl.dispose();
    super.dispose();
  }

  void _calculate() {
    final currentPh = double.tryParse(_currentPhCtrl.text);
    final targetPh = double.tryParse(_targetPhCtrl.text);
    final volume = double.tryParse(_volumeCtrl.text);

    if (currentPh == null || targetPh == null || volume == null) {
      setState(() => _result = null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.fillAllFieldsValid)),
      );
      return;
    }

    if (targetPh == 0 || volume <= 0) {
      setState(() => _result = null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.volumeAndTargetPhMustBePositive)),
      );
      return;
    }

    if (currentPh <= targetPh) {
      setState(() => _result = null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.currentPhMustBeGreaterThanTarget)),
      );
      return;
    }

    final diff = currentPh - targetPh;
    final factor = _factors[_selectedAcid]!;
    final mL = volume * diff * factor;

    setState(() {
      _result = '${mL.toStringAsFixed(2)} mL';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.phAdjustment)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _currentPhCtrl,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.currentPh),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _targetPhCtrl,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.targetPh),
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
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedAcid,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.acid),
              items: _acids.entries
                  .map((e) => DropdownMenuItem(
                        value: e.key,
                        child: Text(e.value),
                      ))
                  .toList(),
              onChanged: (v) {
                if (v != null) {
                  setState(() => _selectedAcid = v);
                }
              },
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _calculate,
              child: Text(AppLocalizations.of(context)!.calculate),
            ),
            if (_result != null) ...[
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      _result!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
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
