import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/domain/engine/nutrient_calculator.dart';
import 'package:hydrobuddy/domain/engine/units.dart';

void main() {
  group('NutrientCalculator', () {
    final kno3 = Substance(id: 1, name: 'KNO3', k: 38.6, nNo3: 13.9);
    final caNo3 = Substance(id: 2, name: 'Ca(NO3)2', ca: 24.4, nNo3: 17.1);
    final mgSo4 = Substance(id: 3, name: 'MgSO4', mg: 20.2, s: 26.6);

    final hoaglandTargets = <Element, double>{
      Element.nNo3: 210, Element.k: 235, Element.ca: 200,
      Element.mg: 48, Element.s: 64,
    };

    test('Hoagland: solves with 3 substances', () {
      final weights = NutrientCalculator.calculateWeights(
        targets: hoaglandTargets, substances: [kno3, caNo3, mgSo4],
      );
      expect(weights, isNotNull);
      expect(weights!.length, 3);
      for (final w in weights.values) { expect(w, greaterThanOrEqualTo(0)); }
    });

    test('Hoagland: ppm conservation within 5%', () {
      final weights = NutrientCalculator.calculateWeights(
        targets: hoaglandTargets, substances: [kno3, caNo3, mgSo4],
      )!;
      final achieved = NutrientCalculator.achievedPpm(
        weights: weights, substances: [kno3, caNo3, mgSo4],
      );
      for (final target in hoaglandTargets.entries) {
        final actual = achieved[target.key] ?? 0.0;
        expect((actual - target.value).abs() / target.value, lessThan(0.05),
          reason: '${target.key.symbol}: ${actual.toStringAsFixed(1)} vs ${target.value}');
      }
    });

    test('EC prediction in plausible range', () {
      final weights = NutrientCalculator.calculateWeights(
        targets: hoaglandTargets, substances: [kno3, caNo3, mgSo4],
      )!;
      final achieved = NutrientCalculator.achievedPpm(
        weights: weights, substances: [kno3, caNo3, mgSo4],
      );
      final ec = NutrientCalculator.predictEc(achievedPpm: achieved);
      expect(ec, greaterThan(0));
      expect(ec, inInclusiveRange(1.0, 8.0));
    });

    test('zero targets yields zero weights', () {
      final weights = NutrientCalculator.calculateWeights(
        targets: {}, substances: [kno3],
      );
      expect(weights, isNotNull);
      expect(weights!.values.every((w) => (w - 0).abs() < 0.01), isTrue);
    });

    test('single 50% K substance hits exact target', () {
      final sub = Substance(id: 1, name: 'Test', k: 50.0);
      final weights = NutrientCalculator.calculateWeights(
        targets: {Element.k: 50000}, substances: [sub],
      )!;
      final achieved = NutrientCalculator.achievedPpm(
        weights: weights, substances: [sub],
      );
      expect(achieved[Element.k], closeTo(50000, 50));
    });

    test('cost calculation uses substance cost', () {
      final cheap = Substance(id: 1, name: 'Cheap', k: 50.0, cost: 10.0);
      final weights = NutrientCalculator.calculateWeights(
        targets: {Element.k: 50000}, substances: [cheap],
      )!;
      final cost = NutrientCalculator.calculateCost(
        weights: weights, substances: [cheap],
      );
      expect(cost, greaterThan(0));
    });
  });

  group('grossErrors', () {
    test('exact match gives 0% error', () {
      final achieved = {Element.k: 200.0};
      final targets = {Element.k: 200.0};
      final errors = NutrientCalculator.grossErrors(
        achieved: achieved, targets: targets,
      );
      expect(errors[Element.k], closeTo(0.0, 0.01));
    });

    test('10% off gives 10% error', () {
      final achieved = {Element.k: 220.0};
      final targets = {Element.k: 200.0};
      final errors = NutrientCalculator.grossErrors(
        achieved: achieved, targets: targets,
      );
      expect(errors[Element.k], closeTo(10.0, 0.01));
    });

    test('target zero gives gross error zero', () {
      final achieved = {Element.zn: 5.0};
      final targets = {Element.zn: 0.0};
      final errors = NutrientCalculator.grossErrors(
        achieved: achieved, targets: targets,
      );
      expect(errors[Element.zn], closeTo(0.0, 0.01));
    });

    test('multiple elements', () {
      final achieved = {Element.k: 210.0, Element.nNo3: 189.0};
      final targets = {Element.k: 200.0, Element.nNo3: 210.0};
      final errors = NutrientCalculator.grossErrors(
        achieved: achieved, targets: targets,
      );
      expect(errors[Element.k], closeTo(5.0, 0.1));
      expect(errors[Element.nNo3], closeTo(10.0, 0.1));
    });
  });

  group('instrumentalErrors', () {
    test('single substance with known ppm gives correct error %', () {
      final sub = Substance(id: 1, name: 'K Salt', k: 50.0);
      final weights = {0: 1.0};
      final achieved = {Element.k: UnitConverter.ppmFromWeight(1.0, 50.0, 1.0)};
      final errors = NutrientCalculator.instrumentalErrors(
        weights: weights,
        substances: [sub],
        achieved: achieved,
        volumeLiters: 1.0,
        weightError: 0.01,
      );
      // weightError 0.01g × (50/100) × 1000 / 1 = 5 ppm error
      // achieved = 1 × (50/100) × 1000 / 1 = 500 ppm
      // error % = 5 / 500 * 100 = 1.0%
      expect(errors[Element.k], closeTo(1.0, 0.01));
    });

    test('element not in achieved gets zero error', () {
      final sub = Substance(id: 1, name: 'K Salt', k: 50.0);
      final weights = {0: 1.0};
      final achieved = <Element, double>{};
      final errors = NutrientCalculator.instrumentalErrors(
        weights: weights,
        substances: [sub],
        achieved: achieved,
        volumeLiters: 1.0,
        weightError: 0.01,
      );
      expect(errors[Element.k], closeTo(0.0, 0.01));
    });

    test('edge case: zero weight salt contributes zero error', () {
      final sub = Substance(id: 1, name: 'K Salt', k: 50.0);
      final weights = {0: 0.0};
      final achieved = {Element.k: 500.0};
      final errors = NutrientCalculator.instrumentalErrors(
        weights: weights,
        substances: [sub],
        achieved: achieved,
        volumeLiters: 1.0,
        weightError: 0.01,
      );
      expect(errors[Element.k], closeTo(0.0, 0.01));
    });

    test('higher weightError increases error proportionally', () {
      final sub = Substance(id: 1, name: 'K Salt', k: 50.0);
      final weights = {0: 1.0};
      final achieved = {Element.k: UnitConverter.ppmFromWeight(1.0, 50.0, 1.0)};
      final errors01 = NutrientCalculator.instrumentalErrors(
        weights: weights,
        substances: [sub],
        achieved: achieved,
        volumeLiters: 1.0,
        weightError: 0.01,
      );
      final errors1 = NutrientCalculator.instrumentalErrors(
        weights: weights,
        substances: [sub],
        achieved: achieved,
        volumeLiters: 1.0,
        weightError: 0.1,
      );
      expect(errors1[Element.k], closeTo(errors01[Element.k]! * 10.0, 0.01));
    });
  });

  group('K2O/P2O5 conversions', () {
    test('k2oToK', () {
      expect(UnitConverter.k2oToK(100.0), closeTo(83.01, 0.01));
    });

    test('kToK2o roundtrip', () {
      final k = UnitConverter.k2oToK(100.0);
      expect(UnitConverter.kToK2o(k), closeTo(100.0, 0.01));
    });

    test('p2o5ToP', () {
      expect(UnitConverter.p2o5ToP(100.0), closeTo(43.64, 0.01));
    });

    test('pToP2o5 roundtrip', () {
      final p = UnitConverter.p2o5ToP(100.0);
      expect(UnitConverter.pToP2o5(p), closeTo(100.0, 0.01));
    });
  });

  group('Si/SiO2 conversions', () {
    test('siToSio2', () {
      expect(UnitConverter.siToSio2(46.84), closeTo(100.0, 0.01));
    });

    test('sio2ToSi', () {
      expect(UnitConverter.sio2ToSi(100.0), closeTo(46.84, 0.01));
    });

    test('sio2ToSi roundtrip', () {
      final si = UnitConverter.sio2ToSi(100.0);
      expect(UnitConverter.siToSio2(si), closeTo(100.0, 0.01));
    });
  });
}
