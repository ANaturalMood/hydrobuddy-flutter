import 'package:flutter_test/flutter_test.dart';

import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/utils/csv_exporter.dart';

void main() {
  group('CSV Exporter', () {
    test('generateCsvContent produces correct header and data rows', () {
      final result = CalculationResult(
        substances: [
          SubstanceResult(substanceId: 1, weight: 10.0, cost: 0.5),
          SubstanceResult(substanceId: 2, weight: 5.0, cost: 1.0),
        ],
        achievedConcentrations: {Element.k: 200.0, Element.nNo3: 150.0},
        targetConcentrations: {Element.k: 210.0, Element.nNo3: 150.0},
        totalCost: 1.5,
        predictedEc: 2.5,
        grossErrors: {Element.k: 5.0, Element.nNo3: 0.0},
        instrumentalErrors: {Element.k: 1.0, Element.nNo3: 0.5},
      );

      final substances = [
        Substance(id: 1, name: 'KNO3', formula: 'KNO3'),
        Substance(id: 2, name: 'Ca(NO3)2', formula: 'Ca(NO3)2'),
      ];

      final csv = generateCsvContent(result, substances);

      expect(csv, contains('Element,Target,Result,GE%,IE%'));
      expect(csv, contains('N-NO3,150.00,150.00,0.00,0.50'));
      expect(csv, contains('K,210.00,200.00,5.00,1.00'));
      expect(csv, contains('Substance,Formula,Amount (g),Cost'));
      expect(csv, contains('KNO3,KNO3,10.0000,0.50'));
      expect(csv, contains('Ca(NO3)2,Ca(NO3)2,5.0000,1.00'));
    });

    test('generateCsvContent skips zero-only element rows', () {
      final result = CalculationResult(
        substances: [],
        achievedConcentrations: {Element.k: 200.0},
        targetConcentrations: {Element.k: 210.0},
        totalCost: 0,
        predictedEc: 0,
        grossErrors: {Element.k: 5.0},
        instrumentalErrors: {Element.k: 1.0},
      );

      final csv = generateCsvContent(result, []);

      expect(csv, contains('K,210.00,200.00,5.00,1.00'));
      expect(csv, isNot(contains('N-NO3')));
      expect(csv, isNot(contains('P')));
    });

    test('generateCsvContent handles empty result gracefully', () {
      final result = CalculationResult(
        substances: [],
        achievedConcentrations: {},
        targetConcentrations: {},
        totalCost: 0,
        predictedEc: 0,
      );

      final csv = generateCsvContent(result, []);

      expect(csv, contains('Element,Target,Result,GE%,IE%'));
      expect(csv, contains('Substance,Formula,Amount (g),Cost'));
    });

    test('generateCsvContent handles unknown substance ID', () {
      final result = CalculationResult(
        substances: [
          SubstanceResult(substanceId: 999, weight: 10.0, cost: 0.5),
        ],
        achievedConcentrations: {},
        targetConcentrations: {},
        totalCost: 0,
        predictedEc: 0,
      );

      final csv = generateCsvContent(result, []);

      expect(csv, contains('Unknown,,10.0000,0.50'));
    });
  });
}
