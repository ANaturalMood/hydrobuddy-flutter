import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class PerSubstanceScreen extends ConsumerWidget {
  const PerSubstanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(calculationResultProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.perSubstanceAnalysis)),
      body: resultAsync.when(
        data: (result) => _buildContent(context, result),
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, CalculationResult result) {
    if (result.substances.isEmpty) {
      return Center(
        child: Text(AppLocalizations.of(context)!.executeCalculationFirst),
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
              child: Text(AppLocalizations.of(context)!.substanceIdNoContribution(sub.substanceId)),
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
                  AppLocalizations.of(context)!.weightCostFormat(sub.weight.toStringAsFixed(3), sub.cost.toStringAsFixed(4)),
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 8),
                DataTable(
                  columnSpacing: 24,
                  columns: [
                    DataColumn(label: Text(AppLocalizations.of(context)!.element)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.ppmContributed)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.percentOfTarget)),
                  ],
                  rows: entries.map((e) {
                    final target = result.targetConcentrations[e.key] ?? 0;
                    final pct = target > 0
                        ? (e.value / target * 100).toStringAsFixed(1)
                        : AppLocalizations.of(context)!.notAvailable;
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
