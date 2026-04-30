import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/domain/engine/nutrient_calculator.dart';

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
}
