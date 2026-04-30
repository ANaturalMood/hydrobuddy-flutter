import 'package:drift/drift.dart' show Value, driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/data/tank_dao.dart';
import 'package:hydrobuddy/ui/providers/tank_provider.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/domain/models/tank.dart';

db.AppDatabase _createMemDb() {
  return db.AppDatabase.forTesting(NativeDatabase.memory());
}

Future<db.TankBatche> _seedTankBatch(db.AppDatabase database) async {
  final dao = TankBatchesDao(database);
  final id = await dao.insert(
    db.TankBatchesCompanion.insert(
      name: 'Test Tank',
      formulation_id: 1,
      volume: 100.0,
      volume_remaining: 90.0,
      prepared_at: DateTime(2024, 1, 15).toIso8601String(),
      notes: const Value('test notes'),
    ),
  );
  return (await dao.getById(id))!;
}

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('TankBatch domain model', () {
    test('TankBatch equality works', () {
      final a = TankBatch(
        id: 1,
        name: 'A',
        formulationId: 1,
        volume: 100,
        volumeRemaining: 50,
        preparedAt: DateTime(2024),
      );
      final b = TankBatch(
        id: 1,
        name: 'A',
        formulationId: 1,
        volume: 100,
        volumeRemaining: 50,
        preparedAt: DateTime(2024),
      );
      expect(a, equals(b));
    });

    test('different id means not equal', () {
      final a = TankBatch(
        id: 1,
        name: 'A',
        formulationId: 1,
        volume: 100,
        volumeRemaining: 50,
        preparedAt: DateTime(2024),
      );
      final b = TankBatch(
        id: 2,
        name: 'A',
        formulationId: 1,
        volume: 100,
        volumeRemaining: 50,
        preparedAt: DateTime(2024),
      );
      expect(a, isNot(equals(b)));
    });
  });

  group('TankUsageEvent domain model', () {
    test('TankUsageEvent equality works', () {
      final a = TankUsageEvent(
        id: 1,
        tankBatchId: 10,
        eventType: 'irrigation',
        volume: 5,
        createdAt: DateTime(2024),
      );
      final b = TankUsageEvent(
        id: 1,
        tankBatchId: 10,
        eventType: 'irrigation',
        volume: 5,
        createdAt: DateTime(2024),
      );
      expect(a, equals(b));
    });
  });

  group('SubstanceUsed domain model', () {
    test('SubstanceUsed equality works', () {
      final a = SubstanceUsed(id: 1, substanceId: 5, weight: 2.5);
      final b = SubstanceUsed(id: 1, substanceId: 5, weight: 2.5);
      expect(a, equals(b));
    });
  });

  group('Tank Batches providers', () {
    test('watchTankBatches returns empty list', () async {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final result = await container.read(watchTankBatchesProvider.future);
      expect(result, isEmpty);
    });

    test('watchTankBatches returns seeded batches', () async {
      final database = _createMemDb();
      await _seedTankBatch(database);
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final result = await container.read(watchTankBatchesProvider.future);
      expect(result.length, 1);
      expect(result.first.name, 'Test Tank');
      expect(result.first.volume, 100.0);
      expect(result.first.preparedAt, DateTime(2024, 1, 15));
    });

    test('tankBatchById returns null for missing id', () async {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final result =
          await container.read(tankBatchByIdProvider(999).future);
      expect(result, isNull);
    });

    test('tankBatchById returns seeded batch', () async {
      final database = _createMemDb();
      final seeded = await _seedTankBatch(database);
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final result =
          await container.read(tankBatchByIdProvider(seeded.id).future);
      expect(result, isNotNull);
      expect(result!.id, seeded.id);
      expect(result.name, 'Test Tank');
    });

    test('deleteTankBatch removes a batch', () async {
      final database = _createMemDb();
      final seeded = await _seedTankBatch(database);
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      await container.read(deleteTankBatchProvider(seeded.id).future);

      final result = await container.read(watchTankBatchesProvider.future);
      expect(result, isEmpty);
    });
  });

  group('TankBatchForm provider', () {
    test('initial state has defaults', () {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final state = container.read(tankBatchFormProvider);
      expect(state.name, '');
      expect(state.volume, 0.0);
    });

    test('setName updates state', () {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      container.read(tankBatchFormProvider.notifier).setName('New Name');
      final state = container.read(tankBatchFormProvider);
      expect(state.name, 'New Name');
    });

    test('loadForEdit loads existing batch', () {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final batch = TankBatch(
        id: 5,
        name: 'Existing',
        formulationId: 2,
        volume: 50,
        volumeRemaining: 30,
        preparedAt: DateTime(2024, 6, 1),
        notes: 'old notes',
      );

      container.read(tankBatchFormProvider.notifier).loadForEdit(batch);
      final state = container.read(tankBatchFormProvider);
      expect(state.id, 5);
      expect(state.name, 'Existing');
      expect(state.formulationId, 2);
      expect(state.notes, 'old notes');
    });

    test('save inserts a new batch into database', () async {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      container.read(tankBatchFormProvider.notifier).setName('Saved Tank');
      container.read(tankBatchFormProvider.notifier).setFormulationId(3);
      container.read(tankBatchFormProvider.notifier).setVolume(200.0);
      container.read(tankBatchFormProvider.notifier).setVolumeRemaining(200.0);

      await container.read(tankBatchFormProvider.notifier).save();

      final dao = TankBatchesDao(database);
      final all = await dao.getAll();
      expect(all.length, 1);
      expect(all.first.name, 'Saved Tank');
    });

    test('reset clears form state', () {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      container.read(tankBatchFormProvider.notifier).setName('Temp');
      container.read(tankBatchFormProvider.notifier).reset();
      expect(container.read(tankBatchFormProvider).name, '');
    });
  });

  group('Usage events providers', () {
    test('watchUsageEvents returns empty for no events', () async {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final result =
          await container.read(watchUsageEventsProvider(1).future);
      expect(result, isEmpty);
    });

    test('addUsageEvent inserts and watchUsageEvents sees it', () async {
      final database = _createMemDb();
      final seeded = await _seedTankBatch(database);
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      await container.read(
        addUsageEventProvider(seeded.id, 'watering', 5.0, null).future,
      );

      final events = await container
          .read(watchUsageEventsProvider(seeded.id).future);
      expect(events.length, 1);
      expect(events.first.eventType, 'watering');
      expect(events.first.volume, 5.0);
      expect(events.first.tankBatchId, seeded.id);
    });
  });

  group('Substances used providers', () {
    test('watchSubstancesUsed returns empty', () async {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final result =
          await container.read(watchSubstancesUsedProvider.future);
      expect(result, isEmpty);
    });

    test('addSubstanceUsed inserts and is seen by watchSubstancesUsed',
        () async {
      final database = _createMemDb();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      await container.read(addSubstanceUsedProvider(42, 3.14).future);

      final result =
          await container.read(watchSubstancesUsedProvider.future);
      expect(result.length, 1);
      expect(result.first.substanceId, 42);
      expect(result.first.weight, 3.14);
    });
  });
}
