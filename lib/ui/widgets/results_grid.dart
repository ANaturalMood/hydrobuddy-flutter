import 'package:flutter/material.dart' hide Element;
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';

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
        _sectionLabel(context, AppLocalizations.of(context)!.elementsStringGrid1),
        _stringGrid1(context),
        const SizedBox(height: 16),
        if (result!.substances.isNotEmpty) ...[
          _sectionLabel(context, AppLocalizations.of(context)!.substancesStringGrid2),
          _stringGrid2(context),
          const SizedBox(height: 16),
        ],
        _sectionLabel(context, AppLocalizations.of(context)!.ecCost),
        _ecMetricsPanel(context),
        if (result!.warnings.isNotEmpty) ...[
          const SizedBox(height: 16),
          _sectionLabel(context, AppLocalizations.of(context)!.warnings),
          _warningsPanel(context),
        ],
      ],
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child:         Text(
          AppLocalizations.of(context)!.fillTargetAndSelectSubstances,
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

  Widget _stringGrid1(BuildContext context) {
    final targets = result!.targetConcentrations;
    final achieved = result!.achievedConcentrations;
    final grossErrors = result!.grossErrors;
    final instrumentalErrors = result!.instrumentalErrors;

    final allElements = <Element>{
      ...targets.keys,
      ...achieved.keys,
    }.toList()
      ..sort((a, b) => a.symbol.compareTo(b.symbol));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 12,
        headingTextStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(fontWeight: FontWeight.bold),
        columns: [
          DataColumn(label: Text(AppLocalizations.of(context)!.element)),
          DataColumn(label: Text(AppLocalizations.of(context)!.target), numeric: true),
          DataColumn(label: Text(AppLocalizations.of(context)!.result), numeric: true),
          DataColumn(label: Text(AppLocalizations.of(context)!.gePercent), numeric: true),
          DataColumn(label: Text(AppLocalizations.of(context)!.iePercent), numeric: true),
        ],
        rows: allElements.map((e) {
          final target = targets[e] ?? 0.0;
          final ach = achieved[e] ?? 0.0;
          final ge = grossErrors[e];
          final ie = instrumentalErrors[e];

          return DataRow(cells: [
            DataCell(Text(e.symbol, style: _cellStyle(context))),
            DataCell(Text(target > 0 ? target.toStringAsFixed(1) : '—',
                style: _cellStyle(context))),
            DataCell(Text(ach.toStringAsFixed(1), style: _cellStyle(context))),
            DataCell(Text(
              ge != null && ge > 0 ? '${ge.toStringAsFixed(1)}%' : '—',
              style: _cellStyle(context).copyWith(
                color: ge != null && ge > 1.0
                    ? Theme.of(context).colorScheme.error
                    : null,
              ),
            )),
            DataCell(Text(
              ie != null && ie > 0 ? '${ie.toStringAsFixed(1)}%' : '—',
              style: _cellStyle(context).copyWith(
                color: ie != null && ie > 20.0
                    ? Theme.of(context).colorScheme.error
                    : null,
              ),
            )),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _stringGrid2(BuildContext context) {
    final substances = result!.substances;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 12,
        headingTextStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(fontWeight: FontWeight.bold),
        columns: [
          DataColumn(label: Text(AppLocalizations.of(context)!.name)),
          DataColumn(label: Text(AppLocalizations.of(context)!.formula)),
          DataColumn(label: Text(AppLocalizations.of(context)!.amountG), numeric: true),
          DataColumn(label: Text(AppLocalizations.of(context)!.cost), numeric: true),
        ],
        rows: substances.map((s) {
          final name = substanceNames[s.substanceId] ?? '#${s.substanceId}';
          final concTag = s.concType != null && s.concType!.isNotEmpty
              ? ' (${s.concType})'
              : '';
          return DataRow(cells: [
            DataCell(Text('$name$concTag', style: _cellStyle(context))),
            DataCell(Text('', style: _cellStyle(context))),
            DataCell(Text(s.weight.toStringAsFixed(2),
                style: _cellStyle(context))),
            DataCell(Text(s.cost.toStringAsFixed(4),
                style: _cellStyle(context))),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _ecMetricsPanel(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _metricRow(context, AppLocalizations.of(context)!.ec,
                '${result!.predictedEc.toStringAsFixed(2)} mS/cm'),
            const SizedBox(height: 4),
            _metricRow(context, AppLocalizations.of(context)!.totalCost,
                'R\$ ${result!.totalCost.toStringAsFixed(4)}'),
          ],
        ),
      ),
    );
  }

  Widget _warningsPanel(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer.withAlpha(80),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: result!.warnings
              .map((w) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded,
                            size: 16,
                            color:
                                Theme.of(context).colorScheme.onErrorContainer),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            w,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
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
