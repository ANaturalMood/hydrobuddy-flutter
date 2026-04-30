import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/models/element.dart' as domain;
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class MixAnalysisScreen extends ConsumerWidget {
  const MixAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(calculationResultProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Composição do Mix')),
      body: resultAsync.when(
        data: (result) => _buildContent(result),
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }

  Widget _buildContent(CalculationResult result) {
    if (result.substances.isEmpty) {
      return const Center(
        child: Text('Execute o cálculo primeiro'),
      );
    }

    final totalWeight = result.substances.fold<double>(
      0.0, (sum, s) => sum + s.weight,
    );

    final ppm = result.achievedConcentrations;
    final totalPpm = ppm.values.fold<double>(0.0, (sum, v) => sum + v);

    final nTotal = (ppm[domain.Element.nNo3] ?? 0) + (ppm[domain.Element.nNh4] ?? 0);
    final p = ppm[domain.Element.p] ?? 0;
    final k = ppm[domain.Element.k] ?? 0;
    final p2o5 = p * 2.29;
    final k2o = k * 1.205;

    final npkRows = <_ElementRow>[
      _ElementRow('N (total)', nTotal, nTotal / totalPpm * 100),
      _ElementRow('P', p, p / totalPpm * 100),
      _ElementRow('P₂O₅', p2o5, p2o5 / totalPpm * 100),
      _ElementRow('K', k, k / totalPpm * 100),
      _ElementRow('K₂O', k2o, k2o / totalPpm * 100),
    ];

    final otherMacro = <domain.Element>[
      domain.Element.ca, domain.Element.mg, domain.Element.s,
      domain.Element.fe, domain.Element.mn, domain.Element.zn, domain.Element.b,
      domain.Element.cu, domain.Element.si, domain.Element.mo, domain.Element.na, domain.Element.cl,
    ].where((e) => (ppm[e] ?? 0) > 0.001).map((e) {
      final v = ppm[e]!;
      return _ElementRow(e.symbol, v, v / totalPpm * 100);
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Resumo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Peso seco total: ${totalWeight.toStringAsFixed(3)} g'),
                Text('Sólidos totais (ppm): ${totalPpm.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Rótulo NPK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  '${nTotal > 0 ? (nTotal / totalPpm * 100).toStringAsFixed(1) : "0"}'
                  '-${p2o5 > 0 ? (p2o5 / totalPpm * 100).toStringAsFixed(1) : "0"}'
                  '-${k2o > 0 ? (k2o / totalPpm * 100).toStringAsFixed(1) : "0"}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'N-P₂O₅-K₂O',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('NPK Detalhado', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildTable(npkRows),
              ],
            ),
          ),
        ),
        if (otherMacro.isNotEmpty)
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Outros Elementos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _buildTable(otherMacro),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTable(List<_ElementRow> rows) {
    return DataTable(
      columnSpacing: 24,
      columns: const [
        DataColumn(label: Text('Elemento')),
        DataColumn(label: Text('ppm')),
        DataColumn(label: Text('% peso')),
      ],
      rows: rows.map((r) => DataRow(cells: [
        DataCell(Text(r.name)),
        DataCell(Text(r.ppm.toStringAsFixed(2))),
        DataCell(Text('${r.pct.toStringAsFixed(1)}%')),
      ])).toList(),
    );
  }
}

class _ElementRow {
  final String name;
  final double ppm;
  final double pct;
  const _ElementRow(this.name, this.ppm, this.pct);
}
