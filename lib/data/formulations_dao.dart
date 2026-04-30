import 'package:drift/drift.dart';
import 'database.dart';
import 'tables.dart';

part 'formulations_dao.g.dart';

@DriftAccessor(tables: [Formulations])
class FormulationsDao extends DatabaseAccessor<AppDatabase> with _$FormulationsDaoMixin {
  FormulationsDao(AppDatabase db) : super(db);

  Future<List<Formulation>> getAll() => select(formulations).get();
  Future<Formulation?> getById(int id) => (select(formulations)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<int> insert(FormulationsCompanion data) => into(formulations).insert(data);
  Future<bool> updateRow(FormulationsCompanion data) => update(formulations).replace(data);
  Future<int> deleteRow(int id) => (delete(formulations)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [FormulationSnapshots])
class SnapshotsDao extends DatabaseAccessor<AppDatabase> with _$SnapshotsDaoMixin {
  SnapshotsDao(AppDatabase db) : super(db);

  Future<List<FormulationSnapshot>> getByFormulationId(int formulationId) {
    return (select(formulationSnapshots)..where((t) => t.formulation_id.equals(formulationId))..orderBy([(t) => OrderingTerm.desc(t.created_at)])).get();
  }
  Future<int> insert(FormulationSnapshotsCompanion data) => into(formulationSnapshots).insert(data);
}
