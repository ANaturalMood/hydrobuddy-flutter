import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/domain/models/formulation.dart';
import 'package:hydrobuddy/domain/models/calculation_input.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';

void main() {
  group('Element', () {
    test('has 16 values', () {
      expect(Element.all.length, 16);
    });

    test('each element has symbol and displayName', () {
      for (final e in Element.all) {
        expect(e.symbol, isNotEmpty);
        expect(e.displayName, isNotEmpty);
      }
    });

    test('symbols are unique', () {
      final symbols = Element.all.map((e) => e.symbol).toSet();
      expect(symbols.length, 16);
    });
  });

  group('Substance', () {
    test('freezed equality works', () {
      final a = Substance(id: 1, name: 'KNO3');
      final b = Substance(id: 1, name: 'KNO3');
      expect(a, equals(b));
    });

    test('different ids are not equal', () {
      final a = Substance(id: 1, name: 'KNO3');
      final b = Substance(id: 2, name: 'KNO3');
      expect(a, isNot(equals(b)));
    });

    test('getN maps elements to composition', () {
      final sub = Substance(id: 1, name: 'Test', k: 38.0, nNo3: 13.0);
      expect(sub.getN(Element.k), 38.0);
      expect(sub.getN(Element.nNo3), 13.0);
      expect(sub.getN(Element.mg), 0.0);
    });

    test('JSON roundtrip', () {
      final sub = Substance(id: 1, name: 'KNO3', k: 38.0, nNo3: 13.0);
      final json = sub.toJson();
      final restored = Substance.fromJson(json);
      expect(restored, equals(sub));
    });
  });

  group('Formulation', () {
    test('JSON roundtrip', () {
      final now = DateTime.now();
      final f = Formulation(
        id: 1,
        name: 'Hoagland',
        createdAt: now,
        updatedAt: now,
        nNo3: 210,
        k: 235,
        p: 31,
        volumeUnit: 'L',
        concUnit: 'ppm',
      );
      final json = f.toJson();
      final restored = Formulation.fromJson(json);
      expect(restored.name, f.name);
      expect(restored.nNo3, f.nNo3);
    });
  });

  group('CalculationInput', () {
    test('defaults are correct', () {
      final input = CalculationInput(
        targets: {Element.nNo3: 200.0},
        substanceIds: [1],
        volume: 100,
        dilutionFactor: 1.0,
      );
      expect(input.volumeUnit, VolumeUnit.liter);
      expect(input.concUnit, ConcUnit.ppm);
      expect(input.calcMode, CalcMode.directAddition);
    });
  });

  group('CalculationResult', () {
    test('stores substance results', () {
      final sr = SubstanceResult(
        substanceId: 1,
        weight: 2.5,
        cost: 0.05,
      );
      final result = CalculationResult(
        substances: [sr],
        achievedConcentrations: {Element.nNo3: 200.0},
        targetConcentrations: {Element.nNo3: 200.0},
        totalCost: 0.05,
        predictedEc: 1.8,
      );
      expect(result.substances.length, 1);
      expect(result.totalCost, 0.05);
      expect(result.error, isNull);
    });
  });
}
