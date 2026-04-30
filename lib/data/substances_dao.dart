import 'package:drift/drift.dart';
import 'database.dart';
import 'tables.dart';

part 'substances_dao.g.dart';

@DriftAccessor(tables: [Substances])
class SubstancesDao extends DatabaseAccessor<AppDatabase> with _$SubstancesDaoMixin {
  SubstancesDao(AppDatabase db) : super(db);

  Future<List<Substance>> getAll() => select(substances).get();
  Future<Substance?> getById(int id) => (select(substances)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<List<Substance>> search(String query) {
    return (select(substances)..where((t) => t.name.like('%$query%'))).get();
  }
  Future<int> insert(SubstancesCompanion data) => into(substances).insert(data);
  Future<void> replaceSubstance(SubstancesCompanion data) => update(substances).replace(data);
  Future<int> deleteSubstance(int id) => (delete(substances)..where((t) => t.id.equals(id))).go();
}
