import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/engine/units.dart';
import 'package:hydrobuddy/domain/engine/chemical_data.dart';

enum EcModel { empirical, lmcV2 }

class EcPredictor {
  static double empirical(Map<Element, double> achievedPpm) {
    double totalMn = 0.0;
    for (final entry in achievedPpm.entries) {
      final molarMass = ChemicalData.getMolarMass(entry.key.symbol);
      if (molarMass > 0 && entry.value > 0) {
        final mm = UnitConverter.ppmToMm(entry.value, molarMass);
        final charge = ChemicalData.getIonicCharge(entry.key.symbol);
        totalMn += UnitConverter.mmToMn(mm, charge);
      }
    }
    return totalMn / 10.0;
  }

  static double lmcV2(Map<Element, double> achievedPpm) {
    const conductivity = <String, double>{
      'N-NO3': 7.14,
      'N-NH4': 7.35,
      'P': 5.2,
      'K': 7.35,
      'Ca': 11.9,
      'Mg': 10.6,
      'S': 16.0,
      'Fe': 5.0,
      'Mn': 5.0,
      'Zn': 5.0,
      'B': 0.0,
      'Cu': 5.0,
      'Si': 5.0,
      'Mo': 5.0,
      'Na': 5.01,
      'Cl': 7.64,
    };

    double totalUsCm = 0.0;
    for (final entry in achievedPpm.entries) {
      final symbol = entry.key.symbol;
      final molarMass = ChemicalData.getMolarMass(symbol);
      final lambda = conductivity[symbol] ?? 0.0;
      if (molarMass > 0 && entry.value > 0 && lambda > 0) {
        final mm = UnitConverter.ppmToMm(entry.value, molarMass);
        totalUsCm += mm * lambda * 1000.0;
      }
    }
    return totalUsCm / 1000.0;
  }

  static double predict(EcModel model, Map<Element, double> achievedPpm) {
    return switch (model) {
      EcModel.empirical => empirical(achievedPpm),
      EcModel.lmcV2 => lmcV2(achievedPpm),
    };
  }
}
