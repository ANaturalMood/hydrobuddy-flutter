import 'package:flutter/material.dart' hide Element;
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';

/// Exibe os resultados do cálculo: tabela de elementos, tabela de substâncias
/// e métricas (EC, custo, ratio NPK).
///
/// Estados:
/// - [result] nulo ou sem targets → mensagem de estado vazio
/// - [result.error] não nulo → banner de erro vermelho
/// - [result] com dados → DataTables + métricas
class ResultsGrid extends StatelessWidget {
  final CalculationResult? result;
  final Map<int, String> substanceNames;

  const ResultsGrid({
    super.key,
    required this.result,
    this.substanceNames = const {},
  });

  @override
  Widget build(BuildContext context) {
    if (result == null || result!.targetConcentrations.isEmpty) {
      return _emptyState(context);
    }

    if (result!.error != null) {
      return _errorBanner(context, result!.error!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel(context, 'Elementos'),
        _elementTable(context),
        const SizedBox(height: 16),
        if (result!.substances.isNotEmpty) ...[
          _sectionLabel(context, 'Substâncias'),
          _substanceTable(context),
          const SizedBox(height: 16),
        ],
        _sectionLabel(context, 'Métricas'),
        _metricsPanel(context),
      ],
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Preencha os nutrientes alvo e selecione substâncias',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ),
    );
  }

  Widget _errorBanner(BuildContext context, String error) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        error,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
      ),
    );
  }

  Widget _sectionLabel(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _elementTable(BuildContext context) {
    final targets = result!.targetConcentrations;
    final achieved = result!.achievedConcentrations;

    // Constrói lista ordenada de elementos que aparecem em targets ou achieved
    final allElements = <Element>{
      ...targets.keys,
      ...achieved.keys,
    }.toList()
      ..sort((Element a, Element b) => a.symbol.compareTo(b.symbol));

    return DataTable(
      columnSpacing: 16,
      headingTextStyle: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(fontWeight: FontWeight.bold),
      columns: const [
        DataColumn(label: Text('Elemento')),
        DataColumn(label: Text('Alvo'), numeric: true),
        DataColumn(label: Text('Real'), numeric: true),
        DataColumn(label: Text('Erro%'), numeric: true),
      ],
      rows: allElements.map((e) {
        final target = targets[e] ?? 0.0;
        final ach = achieved[e] ?? 0.0;
        final err = target > 0 ? ((ach - target) / target * 100) : null;
        return DataRow(cells: [
          DataCell(Text(e.symbol, style: _cellStyle(context))),
          DataCell(Text(target.toStringAsFixed(1), style: _cellStyle(context))),
          DataCell(Text(ach.toStringAsFixed(1), style: _cellStyle(context))),
          DataCell(Text(
            err != null ? '${err.toStringAsFixed(1)}%' : '—',
            style: _cellStyle(context).copyWith(
              color: err != null && err.abs() > 1
                  ? Theme.of(context).colorScheme.error
                  : null,
            ),
          )),
        ]);
      }).toList(),
    );
  }

  Widget _substanceTable(BuildContext context) {
    final substances = result!.substances;

    return DataTable(
      columnSpacing: 16,
      headingTextStyle: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(fontWeight: FontWeight.bold),
      columns: const [
        DataColumn(label: Text('Substância')),
        DataColumn(label: Text('Peso (g)'), numeric: true),
        DataColumn(label: Text('Custo (R\$)'), numeric: true),
      ],
      rows: substances.map((s) {
        final name = substanceNames[s.substanceId] ?? '#${s.substanceId}';
        return DataRow(cells: [
          DataCell(Text(name, style: _cellStyle(context))),
          DataCell(Text(s.weight.toStringAsFixed(2),
              style: _cellStyle(context))),
          DataCell(Text(s.cost.toStringAsFixed(2),
              style: _cellStyle(context))),
        ]);
      }).toList(),
    );
  }

  Widget _metricsPanel(BuildContext context) {
    final achieved = result!.achievedConcentrations;
    final nTotal =
        (achieved[Element.nNo3] ?? 0.0) + (achieved[Element.nNh4] ?? 0.0);
    final p = achieved[Element.p] ?? 0.0;
    final k = achieved[Element.k] ?? 0.0;
    final npk =
        '${nTotal.toStringAsFixed(0)}-${p.toStringAsFixed(0)}-${k.toStringAsFixed(0)}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _metricRow(context, 'EC previsto',
                '${result!.predictedEc.toStringAsFixed(2)} mS/cm'),
            const SizedBox(height: 4),
            _metricRow(context, 'Custo total',
                'R\$ ${result!.totalCost.toStringAsFixed(4)}/L'),
            if (nTotal > 0 || p > 0 || k > 0) ...[
              const SizedBox(height: 4),
              _metricRow(context, 'NPK (N-P₂O₅-K₂O)', npk),
            ],
          ],
        ),
      ),
    );
  }

  Widget _metricRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: _cellStyle(context)),
        Text(value,
            style: _cellStyle(context).copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  TextStyle _cellStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }
}
