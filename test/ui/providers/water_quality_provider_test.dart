import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';

db.AppDatabase _testDb() => db.AppDatabase.forTesting(NativeDatabase.memory());

ProviderContainer _container() {
  final testDb = _testDb();
  final container = ProviderContainer(
    overrides: [databaseProvider.overrideWithValue(testDb)],
  );
  addTearDown(() async {
    await testDb.close();
    container.dispose();
  });
  return container;
}

void main() {
  group('watchWaterQualities', () {
    test('returns empty list initially', () async {
      final container = _container();
      final qualities = await container.read(watchWaterQualitiesProvider.future);
      expect(qualities, isEmpty);
    });

    test('reflects newly created water quality', () async {
      final container = _container();
      final form = container.read(waterQualityFormProvider.notifier);

      await form.create(db.WaterQualityCompanion.insert(
        name: 'Tap Water',
        n_no3: Value(5.0),
        p: Value(1.0),
        k: Value(2.0),
      ));

      final qualities = await container.read(watchWaterQualitiesProvider.future);
      expect(qualities.length, 1);
      expect(qualities.first.name, 'Tap Water');
      expect(qualities.first.n_no3, 5.0);
    });
  });

  group('waterQualityById', () {
    test('returns null for missing id', () async {
      final container = _container();
      final result = await container.read(waterQualityByIdProvider(999).future);
      expect(result, isNull);
    });

    test('returns water quality for existing id', () async {
      final container = _container();
      final form = container.read(waterQualityFormProvider.notifier);
      await form.create(db.WaterQualityCompanion.insert(
        name: 'RO Water',
        ca: Value(10.0),
        mg: Value(5.0),
      ));

      final qualities = await container.read(watchWaterQualitiesProvider.future);
      final id = qualities.first.id;
      final found = await container.read(waterQualityByIdProvider(id).future);
      expect(found, isNotNull);
      expect(found!.name, 'RO Water');
      expect(found.ca, 10.0);
    });
  });

  group('WaterQualityForm update', () {
    test('updates existing water quality', () async {
      final container = _container();
      final form = container.read(waterQualityFormProvider.notifier);
      await form.create(db.WaterQualityCompanion.insert(
        name: 'Tap Water',
        k: Value(3.0),
      ));

      final qualities = await container.read(watchWaterQualitiesProvider.future);
      final existing = qualities.first;

      await form.updateWaterQuality(db.WaterQualityCompanion(
        id: Value(existing.id),
        name: Value('Tap Water - Updated'),
        k: Value(5.0),
      ));

      final updated = await container.read(watchWaterQualitiesProvider.future);
      expect(updated.first.name, 'Tap Water - Updated');
      expect(updated.first.k, 5.0);
    });
  });

  group('deleteWaterQuality', () {
    test('removes water quality and invalidates list', () async {
      final container = _container();
      final form = container.read(waterQualityFormProvider.notifier);
      await form.create(db.WaterQualityCompanion.insert(name: 'A'));
      await form.create(db.WaterQualityCompanion.insert(name: 'B'));

      final before = await container.read(watchWaterQualitiesProvider.future);
      expect(before.length, 2);
      final idToDelete = before.first.id;

      await container.read(deleteWaterQualityProvider(idToDelete).future);

      final after = await container.read(watchWaterQualitiesProvider.future);
      expect(after.length, 1);
      expect(after.first.name, 'B');
    });
  });

  group('watchTissues', () {
    test('returns empty list initially', () async {
      final container = _container();
      final tissues = await container.read(watchTissuesProvider.future);
      expect(tissues, isEmpty);
    });

    test('reflects newly created tissue', () async {
      final container = _container();
      final form = container.read(tissueFormProvider.notifier);

      await form.create(db.TissueAnalysisCompanion.insert(
        name: 'Leaf Sample',
        n: Value(3.0),
        p: Value(0.5),
        k: Value(2.0),
      ));

      final tissues = await container.read(watchTissuesProvider.future);
      expect(tissues.length, 1);
      expect(tissues.first.name, 'Leaf Sample');
      expect(tissues.first.n, 3.0);
    });
  });

  group('deleteTissue', () {
    test('removes tissue and invalidates list', () async {
      final container = _container();
      final form = container.read(tissueFormProvider.notifier);
      await form.create(db.TissueAnalysisCompanion.insert(name: 'Sample A'));
      await form.create(db.TissueAnalysisCompanion.insert(name: 'Sample B'));

      final before = await container.read(watchTissuesProvider.future);
      expect(before.length, 2);
      final idToDelete = before.first.id;

      await container.read(deleteTissueProvider(idToDelete).future);

      final after = await container.read(watchTissuesProvider.future);
      expect(after.length, 1);
      expect(after.first.name, 'Sample B');
    });
  });
}
