import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/engine/ratio_calculator.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/models/element.dart' as domain;
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class RatioScreen extends ConsumerWidget {
  const RatioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(calculationResultProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Ratios Nutricionais')),
      body: resultAsync.when(
        data: (result) => _buildContent(result),
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }

  Widget _buildContent(CalculationResult result) {
    final ppm = result.achievedConcentrations;

    if (ppm.isEmpty) {
      return const Center(
        child: Text('Execute o cálculo primeiro'),
      );
    }

    final npk = RatioCalculator.npk(ppm);
    final caMg = RatioCalculator.caToMg(ppm);
    final kCaMg = RatioCalculator.kCaMg(ppm);
    final nS = RatioCalculator.nToS(ppm);
    final caMgK = _caToMgPlusK(ppm);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildRatioCard(
          'NPK',
          'N : P : K',
          [npk['N'] ?? 0, npk['P'] ?? 0, npk['K'] ?? 0],
        ),
        _buildRatioCard(
          'K : Ca : Mg',
          'K : Ca : Mg',
          [kCaMg['K'] ?? 0, kCaMg['Ca'] ?? 0, kCaMg['Mg'] ?? 0],
        ),
        _buildSingleRatioCard('Ca : Mg', 'Ca : Mg', caMg),
        _buildSingleRatioCard('N : S', 'N : S', nS),
        _buildSingleRatioCard('Ca : (Mg + K)', 'Ca : (Mg+K)', caMgK),
      ],
    );
  }

  Widget _buildRatioCard(String title, String label, List<double> values) {
    final formatted = values.map((v) => _fmt(v, values)).join(' : ');
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 6),
            Text(formatted, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleRatioCard(String title, String label, double ratio) {
    final formatted = ratio == double.infinity || ratio <= 0
        ? 'N/A'
        : '${ratio.toStringAsFixed(1)} : 1';
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 6),
            Text(formatted, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  String _fmt(double v, List<double> all) {
    if (v <= 0) return '?';
    return v.toStringAsFixed(1);
  }

  double _caToMgPlusK(Map<Enum, double> ppm) {
    final ca = ppm[domain.Element.ca] ?? 0.0;
    final mg = ppm[domain.Element.mg] ?? 0.0;
    final k = ppm[domain.Element.k] ?? 0.0;
    final denom = mg + k;
    return denom > 0 ? ca / denom : double.infinity;
  }
}
