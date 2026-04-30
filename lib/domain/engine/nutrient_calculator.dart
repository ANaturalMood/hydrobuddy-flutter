import 'dart:typed_data';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/domain/engine/least_squares.dart';
import 'package:hydrobuddy/domain/engine/units.dart';
import 'package:hydrobuddy/domain/engine/chemical_data.dart';

class NutrientCalculator {
  /// Returns map of substance index → grams, or null if unsolvable.
  static Map<int, double>? calculateWeights({
    required Map<Element, double> targets,
    required List<Substance> substances,
    double volumeLiters = 1.0,
  }) {
    final cols = substances.length; // unknowns
    final rows = Element.all.length; // equations

    // A is [elements × substances]: each row = element, each col = substance
    final a = Float64List(rows * cols);
    final b = Float64List(rows);

    for (int j = 0; j < rows; j++) {
      final element = Element.all[j];
      for (int i = 0; i < cols; i++) {
        a[j * cols + i] = substances[i].getN(element) / 100.0;
      }
      b[j] = (targets[element] ?? 0.0) * volumeLiters / 1000.0;
    }

    final x = LeastSquaresSolver.solve(a, rows, cols, b);
    if (x == null) return null;

    final weights = <int, double>{};
    for (int i = 0; i < cols; i++) {
      weights[i] = x[i] < 0 ? 0.0 : x[i];
    }
    return weights;
  }

  static Map<Element, double> achievedPpm({
    required Map<int, double> weights,
    required List<Substance> substances,
    double volumeLiters = 1.0,
  }) {
    final result = <Element, double>{};
    for (final element in Element.all) {
      double total = 0.0;
      for (int i = 0; i < substances.length; i++) {
        total += UnitConverter.ppmFromWeight(
          weights[i] ?? 0.0,
          substances[i].getN(element),
          volumeLiters,
        );
      }
      result[element] = total;
    }
    return result;
  }

  static double predictEc({required Map<Element, double> achievedPpm}) {
    double totalMn = 0.0;
    for (final entry in achievedPpm.entries) {
      final symbol = entry.key.symbol;
      final molarMass = ChemicalData.getMolarMass(symbol);
      if (molarMass > 0 && entry.value > 0) {
        final mm = UnitConverter.ppmToMm(entry.value, molarMass);
        totalMn += UnitConverter.mmToMn(mm, ChemicalData.getIonicCharge(symbol));
      }
    }
    return totalMn / 10.0;
  }

  static double calculateCost({
    required Map<int, double> weights,
    required List<Substance> substances,
  }) {
    double total = 0.0;
    for (int i = 0; i < substances.length; i++) {
      total += (weights[i] ?? 0.0) / 1000.0 * substances[i].cost;
    }
    return total;
  }

  static Map<Element, double> grossErrors({
    required Map<Element, double> achieved,
    required Map<Element, double> targets,
  }) {
    final errors = <Element, double>{};
    for (final entry in targets.entries) {
      final target = entry.value;
      if (target.abs() < 0.0001) {
        errors[entry.key] = 0.0;
      } else {
        final actual = achieved[entry.key] ?? 0.0;
        errors[entry.key] = (actual - target).abs() / target * 100.0;
      }
    }
    return errors;
  }

  static Map<Element, double> instrumentalErrors({
    required Map<int, double> weights,
    required List<Substance> substances,
    required Map<Element, double> achieved,
    double volumeLiters = 1.0,
    double weightError = 0.01,
  }) {
    final errors = <Element, double>{};
    for (final element in Element.all) {
      double totalPpmError = 0.0;
      for (int i = 0; i < substances.length; i++) {
        final w = weights[i] ?? 0.0;
        if (w > 0) {
          totalPpmError += UnitConverter.ppmFromWeight(
            weightError,
            substances[i].getN(element),
            volumeLiters,
          );
        }
      }
      final achievedPpm = achieved[element] ?? 0.0;
      if (achievedPpm.abs() > 0.0001) {
        errors[element] = totalPpmError / achievedPpm * 100.0;
      } else {
        errors[element] = 0.0;
      }
    }
    return errors;
  }
}
