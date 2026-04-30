import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class StockAnalysisScreen extends ConsumerWidget {
  const StockAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(calculationResultProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Análise de Estoque (A+B)')),
      body: resultAsync.when(
        data: (result) => _buildContent(context, ref, result),
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) =>
            Center(child: Text('Erro: $e')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, CalculationResult result) {
    if (result.substances.isEmpty) {
      return const Center(
        child: Text('Execute o cálculo primeiro'),
      );
    }

    final dilutionFactor = ref.watch(dilutionFactorProvider);
    final stockA = result.substances.where((s) => s.concType == 'A').toList();
    final stockB = result.substances.where((s) => s.concType == 'B').toList();
    final other = result.substances.where(
      (s) => s.concType != 'A' && s.concType != 'B',
    ).toList();

    final substances = [...stockA, ...stockB, ...other];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Fatores', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Fator de diluição: ${dilutionFactor.toStringAsFixed(1)}x'),
                  Text('Volume de estoque: ${ref.watch(volumeLitersProvider).toStringAsFixed(2)} L'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Substância')),
                    DataColumn(label: Text('Estoque A (g)')),
                    DataColumn(label: Text('Estoque B (g)')),
                    DataColumn(label: Text('Peso Total (g)')),
                  ],
                  rows: substances.map((s) {
                    final stockWeight = s.weight * dilutionFactor;
                    return DataRow(cells: [
                      DataCell(Text('ID ${s.substanceId}')),
                      DataCell(Text(s.concType == 'A'
                          ? stockWeight.toStringAsFixed(3)
                          : '-')),
                      DataCell(Text(s.concType == 'B'
                          ? stockWeight.toStringAsFixed(3)
                          : '-')),
                      DataCell(Text(stockWeight.toStringAsFixed(3))),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
