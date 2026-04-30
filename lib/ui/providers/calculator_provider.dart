import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/data/database.dart' as drift;
import 'package:hydrobuddy/data/substances_dao.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/substance.dart' as domain;
import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/engine/nutrient_calculator.dart';
import 'package:hydrobuddy/domain/engine/units.dart';

part 'calculator_provider.g.dart';

// ========== Inputs independentes ==========

@riverpod
class TargetNutrients extends _$TargetNutrients {
  @override
  Map<Element, double> build() => {};

  void set(Map<Element, double> value) => state = value;
}

@riverpod
class SelectedSubstanceIds extends _$SelectedSubstanceIds {
  @override
  List<int> build() => [];

  void set(List<int> value) => state = value;
}

@riverpod
class VolumeLiters extends _$VolumeLiters {
  @override
  double build() => 1.0;

  void set(double value) => state = value;
}

@riverpod
class VolumeUnit extends _$VolumeUnit {
  @override
  calc.VolumeUnit build() => calc.VolumeUnit.liter;

  void set(calc.VolumeUnit value) => state = value;
}

@riverpod
class ConcentrationUnit extends _$ConcentrationUnit {
  @override
  calc.ConcUnit build() => calc.ConcUnit.ppm;

  void set(calc.ConcUnit value) => state = value;
}

@riverpod
class WeightUnit extends _$WeightUnit {
  @override
  calc.WeightUnit build() => calc.WeightUnit.gram;

  void set(calc.WeightUnit value) => state = value;
}

@riverpod
class CalculationMode extends _$CalculationMode {
  @override
  calc.CalcMode build() => calc.CalcMode.directAddition;

  void set(calc.CalcMode value) => state = value;
}

@riverpod
class DilutionFactor extends _$DilutionFactor {
  @override
  double build() => 1.0;

  void set(double value) => state = value;
}

@riverpod
class DegreeOfFreedom extends _$DegreeOfFreedom {
  @override
  Element? build() => null;

  void set(Element? value) => state = value;
}

// ========== Provider computado COM DEBOUNCE ==========

@riverpod
Future<CalculationResult> calculationResult(CalculationResultRef ref) async {
  final targets = ref.watch(targetNutrientsProvider);
  final substanceIds = ref.watch(selectedSubstanceIdsProvider);
  final volume = ref.watch(volumeLitersProvider);
  final volumeUnit = ref.watch(volumeUnitProvider);
  final concUnit = ref.watch(concentrationUnitProvider);
  final weightUnit = ref.watch(weightUnitProvider);
  final calcMode = ref.watch(calculationModeProvider);
  final dilutionFactor = ref.watch(dilutionFactorProvider);
  final dof = ref.watch(degreeOfFreedomProvider);

  if (targets.isEmpty || substanceIds.isEmpty) {
    return const CalculationResult(
      substances: [],
      achievedConcentrations: {},
      targetConcentrations: {},
      totalCost: 0,
      predictedEc: 0,
    );
  }

  await Future<void>.delayed(const Duration(milliseconds: 300));

  // Carrega substâncias do banco pelos IDs
  final db = ref.read(databaseProvider);
  final dao = SubstancesDao(db);
  final driftSubstances = <drift.Substance>[];
  for (final id in substanceIds) {
    final s = await dao.getById(id);
    if (s != null) driftSubstances.add(s);
  }

  if (driftSubstances.isEmpty) {
    return CalculationResult(
      substances: [],
      achievedConcentrations: {},
      targetConcentrations: targets,
      totalCost: 0,
      predictedEc: 0,
      error: 'Nenhuma substância encontrada para os IDs fornecidos',
    );
  }

  // Mapeia Drift Substance → domain Substance
  final substances = driftSubstances.map(_mapDriftToDomain).toList();

  // Calcula pesos via mínimos quadrados
  final weights = NutrientCalculator.calculateWeights(
    targets: targets,
    substances: substances,
    volumeLiters: volume,
  );

  if (weights == null) {
    return CalculationResult(
      substances: [],
      achievedConcentrations: {},
      targetConcentrations: targets,
      totalCost: 0,
      predictedEc: 0,
      error: 'Sistema insolúvel — verifique as substâncias selecionadas',
    );
  }

  final achieved = NutrientCalculator.achievedPpm(
    weights: weights,
    substances: substances,
    volumeLiters: volume,
  );
  final ec = NutrientCalculator.predictEc(achievedPpm: achieved);
  final totalCost = NutrientCalculator.calculateCost(
    weights: weights,
    substances: substances,
  );

  // Monta per-substance contributions
  final substanceResults = weights.entries.map((e) {
    final sub = substances[e.key];
    final contribution = <Element, double>{};
    for (final elem in Element.all) {
      final ppm = UnitConverter.ppmFromWeight(e.value, sub.getN(elem), volume);
      if (ppm > 0.0001) contribution[elem] = ppm;
    }
    return SubstanceResult(
      substanceId: sub.id,
      weight: e.value,
      cost: e.value / 1000.0 * sub.cost,
      elementContribution: contribution,
      concType: sub.concType,
    );
  }).toList();

  return CalculationResult(
    substances: substanceResults,
    achievedConcentrations: achieved,
    targetConcentrations: targets,
    totalCost: totalCost,
    predictedEc: ec,
  );
}

// ========== Helper de mapeamento ==========

domain.Substance _mapDriftToDomain(drift.Substance d) {
  return domain.Substance(
    id: d.id,
    name: d.name,
    formula: d.formula,
    source: d.source,
    purity: d.purity,
    cost: d.cost,
    isLiquid: d.is_liquid,
    density: d.density,
    concType: d.conc_type,
    nNo3: d.n_no3,
    nNh4: d.n_nh4,
    p: d.p,
    k: d.k,
    ca: d.ca,
    mg: d.mg,
    s: d.s,
    fe: d.fe,
    mn: d.mn,
    zn: d.zn,
    b: d.b,
    cu: d.cu,
    si: d.si,
    mo: d.mo,
    na: d.na,
    cl: d.cl,
  );
}
