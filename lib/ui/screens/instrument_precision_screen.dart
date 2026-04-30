import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';

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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.instrumentPrecision)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            AppLocalizations.of(context)!.instrumentPrecisionDescription,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _volumeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.volumeError,
              helperText: AppLocalizations.of(context)!.volumetricGlasswareUncertainty,
              suffixText: 'mL',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.weightError,
              helperText: AppLocalizations.of(context)!.analyticalBalanceUncertainty,
              suffixText: 'g',
            ),
          ),
        ],
      ),
    );
  }
}
