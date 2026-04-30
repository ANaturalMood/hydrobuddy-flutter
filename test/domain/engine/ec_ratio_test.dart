import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/engine/ec_prediction.dart';
import 'package:hydrobuddy/domain/engine/ratio_calculator.dart';

void main() {
  group('EcPredictor', () {
    final hoaglandPpm = <Element, double>{
      Element.nNo3: 210,
      Element.k: 235,
      Element.ca: 200,
      Element.mg: 48,
      Element.s: 64,
    };

    test('empirical model gives positive EC', () {
      final ec = EcPredictor.empirical(hoaglandPpm);
      expect(ec, greaterThan(0));
      expect(ec, inInclusiveRange(1.0, 8.0));
    });

    test('LMCv2 model gives positive EC', () {
      final ec = EcPredictor.lmcV2(hoaglandPpm);
      expect(ec, greaterThan(0));
    });

    test('both models return plausible values', () {
      final ecEmp = EcPredictor.empirical(hoaglandPpm);
      final ecLmc = EcPredictor.lmcV2(hoaglandPpm);
      expect(ecEmp, greaterThan(0));
      expect(ecLmc, greaterThan(0));
    });

    test('empty ppm gives zero EC', () {
      expect(EcPredictor.empirical({}), 0.0);
      expect(EcPredictor.lmcV2({}), 0.0);
    });
  });

  group('RatioCalculator', () {
    final balanced = <Element, double>{
      Element.nNo3: 200,
      Element.p: 50,
      Element.k: 200,
      Element.ca: 150,
      Element.mg: 50,
    };

    test('NPK ratio normalized', () {
      final npk = RatioCalculator.npk(balanced);
      expect(npk['P'], 1.0);
      expect(npk['N'], closeTo(4.0, 0.1));
      expect(npk['K'], closeTo(4.0, 0.1));
    });

    test('Ca:Mg ratio', () {
      final ratio = RatioCalculator.caToMg(balanced);
      expect(ratio, closeTo(3.0, 0.1));
    });

    test('K:Ca:Mg ratio', () {
      final kcm = RatioCalculator.kCaMg(balanced);
      expect(kcm['Mg'], 1.0);
      expect(kcm['K'], closeTo(4.0, 0.1));
      expect(kcm['Ca'], closeTo(3.0, 0.1));
    });

    test('N:S ratio', () {
      final withS = <Element, double>{
        Element.nNo3: 210,
        Element.s: 64,
      };
      final ratio = RatioCalculator.nToS(withS);
      expect(ratio, closeTo(3.28, 0.1));
    });

    test('all ratios map', () {
      final ratios = RatioCalculator.all(balanced);
      expect(ratios['NPK_N'], greaterThan(0));
      expect(ratios['Ca:Mg'], greaterThan(0));
    });
  });
}
