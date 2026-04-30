import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/domain/engine/units.dart';
import 'package:hydrobuddy/domain/engine/chemical_data.dart';

void main() {
  group('UnitConverter', () {
    test('liter to gallon', () {
      expect(UnitConverter.literToGallon(3.785), closeTo(1.0, 0.01));
    });

    test('gallon to liter', () {
      expect(UnitConverter.gallonToLiter(1.0), closeTo(3.785, 0.01));
    });

    test('ppm from weight', () {
      final ppm = UnitConverter.ppmFromWeight(1.0, 38.0, 1.0);
      expect(ppm, closeTo(380.0, 0.1));
    });

    test('ppm to mM', () {
      final mm = UnitConverter.ppmToMm(391.0, 39.098);
      expect(mm, closeTo(10.0, 0.1));
    });

    test('mm to mN', () {
      final mn = UnitConverter.mmToMn(10.0, 2);
      expect(mn, 20.0);
    });

    test('gram to ounce', () {
      expect(UnitConverter.gramToOunce(28.35), closeTo(1.0, 0.01));
    });
  });

  group('ChemicalData', () {
    test('known molar masses', () {
      expect(ChemicalData.getMolarMass('K'), 39.098);
      expect(ChemicalData.getMolarMass('N'), 14.007);
      expect(ChemicalData.getMolarMass('Ca'), 40.078);
    });

    test('unknown element returns 0', () {
      expect(ChemicalData.getMolarMass('Xx'), 0.0);
    });

    test('ionic charges', () {
      expect(ChemicalData.getIonicCharge('Ca'), 2);
      expect(ChemicalData.getIonicCharge('K'), 1);
    });

    test('compound molar masses defined', () {
      expect(ChemicalData.compoundMolarMass['KNO3'], 101.103);
      expect(ChemicalData.compoundMolarMass['Ca(NO3)2'], 164.088);
    });
  });
}
