import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';

import 'package:hydrobuddy/data/database.dart' as drift;
import 'package:hydrobuddy/data/substances_dao.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';

ProviderContainer _createContainer({drift.AppDatabase? db}) {
  final effectiveDb = db ?? drift.AppDatabase.forTesting(NativeDatabase.memory());
  return ProviderContainer(
    overrides: [
      databaseProvider.overrideWithValue(effectiveDb),
    ],
  );
}

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('Input providers — defaults', () {
    test('TargetNutrients starts empty', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(targetNutrientsProvider), isEmpty);
    });

    test('SelectedSubstanceIds starts empty', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(selectedSubstanceIdsProvider), isEmpty);
    });

    test('VolumeLiters starts at 1.0', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(volumeLitersProvider), 1.0);
    });

    test('VolumeUnit starts at liter', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(volumeUnitProvider), calc.VolumeUnit.liter);
    });

    test('ConcentrationUnit starts at ppm', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(concentrationUnitProvider), calc.ConcUnit.ppm);
    });

    test('WeightUnit starts at gram', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(weightUnitProvider), calc.WeightUnit.gram);
    });

    test('CalculationMode starts at directAddition', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(
        container.read(calculationModeProvider),
        calc.CalcMode.directAddition,
      );
    });

    test('DilutionFactor starts at 1.0', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(dilutionFactorProvider), 1.0);
    });

    test('DegreeOfFreedom starts null', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      expect(container.read(degreeOfFreedomProvider), isNull);
    });
  });

  group('Input providers — update', () {
    test('TargetNutrients can be updated and read back', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      final targets = {Element.k: 200.0, Element.ca: 180.0};
      container.read(targetNutrientsProvider.notifier).set(targets);
      expect(container.read(targetNutrientsProvider), targets);
    });

    test('SelectedSubstanceIds can be updated and read back', () {
      final container = _createContainer();
      addTearDown(container.dispose);
      container.read(selectedSubstanceIdsProvider.notifier).set([1, 2, 3]);
      expect(container.read(selectedSubstanceIdsProvider), [1, 2, 3]);
    });
  });

  group('calculationResult — empty inputs', () {
    test('empty targets and empty substanceIds returns empty result', () async {
      final container = _createContainer();
      addTearDown(container.dispose);

      final result = await container.read(calculationResultProvider.future);
      expect(result.substances, isEmpty);
      expect(result.achievedConcentrations, isEmpty);
      expect(result.targetConcentrations, isEmpty);
      expect(result.totalCost, 0);
      expect(result.predictedEc, 0);
      expect(result.error, isNull);
    });

    test('valid targets but empty substanceIds returns empty result', () async {
      final container = _createContainer();
      addTearDown(container.dispose);

      container
          .read(targetNutrientsProvider.notifier)
          .set({Element.k: 200.0});

      final result = await container.read(calculationResultProvider.future);
      expect(result.substances, isEmpty);
      expect(result.error, isNull);
    });
  });

  group('calculationResult — com dados reais', () {
    test('calcula resultado com substâncias do banco', () async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      final dao = SubstancesDao(db);
      final id1 = await dao.insert(drift.SubstancesCompanion.insert(
        name: 'KNO3',
        n_no3: const Value(13.9),
        k: const Value(38.6),
        cost: const Value(5.0),
      ));
      final id2 = await dao.insert(drift.SubstancesCompanion.insert(
        name: 'Ca(NO3)2',
        n_no3: const Value(17.1),
        ca: const Value(24.4),
        cost: const Value(6.0),
      ));
      final id3 = await dao.insert(drift.SubstancesCompanion.insert(
        name: 'MgSO4',
        mg: const Value(20.2),
        s: const Value(26.6),
        cost: const Value(3.0),
      ));

      container.read(targetNutrientsProvider.notifier).set({
        Element.nNo3: 210,
        Element.k: 235,
        Element.ca: 200,
        Element.mg: 48,
        Element.s: 64,
      });
      container.read(selectedSubstanceIdsProvider.notifier).set([id1, id2, id3]);

      final result = await container.read(calculationResultProvider.future);
      expect(result.error, isNull);
      expect(result.substances.length, 3);
      expect(result.totalCost, greaterThan(0));
      expect(result.predictedEc, greaterThan(0));
      expect(result.achievedConcentrations, isNotEmpty);
      expect(result.targetConcentrations, isNotEmpty);
    });
  });
}
