import 'dart:io';

import 'package:csv/csv.dart';

import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart';

String generateCsvContent(
  CalculationResult result,
  List<Substance> substances,
) {
  final rows = <List<String>>[];

  rows.add(const ['Element', 'Target', 'Result', 'GE%', 'IE%']);

  for (final element in Element.all) {
    final target = result.targetConcentrations[element] ?? 0.0;
    final achieved = result.achievedConcentrations[element] ?? 0.0;
    final ge = result.grossErrors[element] ?? 0.0;
    final ie = result.instrumentalErrors[element] ?? 0.0;
    if (target == 0 && achieved == 0 && ge == 0 && ie == 0) continue;
    rows.add([
      element.symbol,
      target.toStringAsFixed(2),
      achieved.toStringAsFixed(2),
      ge.toStringAsFixed(2),
      ie.toStringAsFixed(2),
    ]);
  }

  rows.add([]);

  rows.add(const ['Substance', 'Formula', 'Amount (g)', 'Cost']);

  final subMap = {for (final s in substances) s.id: s};

  for (final sr in result.substances) {
    final sub = subMap[sr.substanceId];
    rows.add([
      sub?.name ?? 'Unknown',
      sub?.formula ?? '',
      sr.weight.toStringAsFixed(4),
      sr.cost.toStringAsFixed(2),
    ]);
  }

  return const ListToCsvConverter().convert(rows);
}

Future<void> exportCsvToFile(
  String path,
  CalculationResult result,
  List<Substance> substances,
) async {
  final content = generateCsvContent(result, substances);
  await File(path).writeAsString(content);
}
