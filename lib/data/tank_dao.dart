import 'package:drift/drift.dart';
import 'database.dart';
import 'tables.dart';

part 'tank_dao.g.dart';

@DriftAccessor(tables: [SubstancesUsed])
class SubstancesUsedDao extends DatabaseAccessor<AppDatabase> with _$SubstancesUsedDaoMixin {
  SubstancesUsedDao(AppDatabase db) : super(db);

  Future<List<SubstancesUsedData>> getAll() => select(substancesUsed).get();
  Future<int> insert(SubstancesUsedCompanion data) => into(substancesUsed).insert(data);
  Future<bool> updateRow(SubstancesUsedCompanion data) => update(substancesUsed).replace(data);
  Future<int> deleteRow(int id) => (delete(substancesUsed)..where((t) => t.id.equals(id))).go();
  Future<void> deleteAll() => delete(substancesUsed).go();
}

@DriftAccessor(tables: [TankBatches])
class TankBatchesDao extends DatabaseAccessor<AppDatabase> with _$TankBatchesDaoMixin {
  TankBatchesDao(AppDatabase db) : super(db);

  Future<List<TankBatche>> getAll() => select(tankBatches).get();
  Future<TankBatche?> getById(int id) => (select(tankBatches)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<int> insert(TankBatchesCompanion data) => into(tankBatches).insert(data);
  Future<bool> updateRow(TankBatchesCompanion data) => update(tankBatches).replace(data);
  Future<int> deleteRow(int id) => (delete(tankBatches)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [TankUsageEvents])
class TankUsageEventsDao extends DatabaseAccessor<AppDatabase> with _$TankUsageEventsDaoMixin {
  TankUsageEventsDao(AppDatabase db) : super(db);

  Future<List<TankUsageEvent>> getByTankId(int tankBatchId) {
    return (select(tankUsageEvents)..where((t) => t.tank_batch_id.equals(tankBatchId))..orderBy([(t) => OrderingTerm.desc(t.created_at)])).get();
  }
  Future<int> insert(TankUsageEventsCompanion data) => into(tankUsageEvents).insert(data);
}
