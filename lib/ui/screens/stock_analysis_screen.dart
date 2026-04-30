import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';

class StockAnalysisScreen extends ConsumerWidget {
  const StockAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(calculationResultProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.stockAnalysis)),
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
      return Center(
        child: Text(AppLocalizations.of(context)!.executeCalculationFirst),
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
                  Text(AppLocalizations.of(context)!.factors, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(AppLocalizations.of(context)!.dilutionFactorLabel(dilutionFactor.toStringAsFixed(1))),
                  Text(AppLocalizations.of(context)!.stockVolumeLabel(ref.watch(volumeLitersProvider).toStringAsFixed(2))),
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
                  columns: [
                    DataColumn(label: Text(AppLocalizations.of(context)!.substance)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.stockA)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.stockB)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.totalWeight)),
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
