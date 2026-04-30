import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class PerSubstanceScreen extends ConsumerWidget {
  const PerSubstanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(calculationResultProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Análise por Substância')),
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

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: result.substances.length,
      itemBuilder: (context, index) {
        final sub = result.substances[index];
        final entries = sub.elementContribution.entries.toList();

        if (entries.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Substância ID ${sub.substanceId} — sem contribuição'),
            ),
          );
        }

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Substância ID ${sub.substanceId}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Peso: ${sub.weight.toStringAsFixed(3)} g | Custo: R\$ ${sub.cost.toStringAsFixed(4)}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 8),
                DataTable(
                  columnSpacing: 24,
                  columns: const [
                    DataColumn(label: Text('Elemento')),
                    DataColumn(label: Text('ppm contribuído')),
                    DataColumn(label: Text('% do alvo')),
                  ],
                  rows: entries.map((e) {
                    final target = result.targetConcentrations[e.key] ?? 0;
                    final pct = target > 0
                        ? (e.value / target * 100).toStringAsFixed(1)
                        : 'N/A';
                    return DataRow(cells: [
                      DataCell(Text(e.key.symbol)),
                      DataCell(Text(e.value.toStringAsFixed(4))),
                      DataCell(Text('$pct%')),
                    ]);
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
