import 'package:drift/drift.dart' show Value;
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/data/substances_dao.dart';
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'substances_provider.g.dart';

Substance _toDomain(db.Substance row) {
  return Substance(
    id: row.id,
    name: row.name,
    formula: row.formula,
    source: row.source,
    purity: row.purity,
    cost: row.cost,
    isLiquid: row.is_liquid,
    density: row.density,
    concType: row.conc_type,
    nNo3: row.n_no3,
    nNh4: row.n_nh4,
    p: row.p,
    k: row.k,
    ca: row.ca,
    mg: row.mg,
    s: row.s,
    fe: row.fe,
    mn: row.mn,
    zn: row.zn,
    b: row.b,
    cu: row.cu,
    si: row.si,
    mo: row.mo,
    na: row.na,
    cl: row.cl,
  );
}

db.SubstancesCompanion _toCompanion(Substance s) {
  return db.SubstancesCompanion(
    id: Value(s.id),
    name: Value(s.name),
    formula: Value(s.formula),
    source: Value(s.source),
    purity: Value(s.purity),
    cost: Value(s.cost),
    is_liquid: Value(s.isLiquid),
    density: Value(s.density),
    conc_type: Value(s.concType),
    n_no3: Value(s.nNo3),
    n_nh4: Value(s.nNh4),
    p: Value(s.p),
    k: Value(s.k),
    ca: Value(s.ca),
    mg: Value(s.mg),
    s: Value(s.s),
    fe: Value(s.fe),
    mn: Value(s.mn),
    zn: Value(s.zn),
    b: Value(s.b),
    cu: Value(s.cu),
    si: Value(s.si),
    mo: Value(s.mo),
    na: Value(s.na),
    cl: Value(s.cl),
  );
}

db.SubstancesCompanion _toInsertCompanion(Substance s) {
  return db.SubstancesCompanion.insert(
    name: s.name,
    formula: Value(s.formula),
    source: Value(s.source),
    purity: Value(s.purity),
    cost: Value(s.cost),
    is_liquid: Value(s.isLiquid),
    density: Value(s.density),
    conc_type: Value(s.concType),
    n_no3: Value(s.nNo3),
    n_nh4: Value(s.nNh4),
    p: Value(s.p),
    k: Value(s.k),
    ca: Value(s.ca),
    mg: Value(s.mg),
    s: Value(s.s),
    fe: Value(s.fe),
    mn: Value(s.mn),
    zn: Value(s.zn),
    b: Value(s.b),
    cu: Value(s.cu),
    si: Value(s.si),
    mo: Value(s.mo),
    na: Value(s.na),
    cl: Value(s.cl),
  );
}

@riverpod
Future<List<Substance>> watchSubstances(WatchSubstancesRef ref) async {
  final database = ref.watch(databaseProvider);
  final dao = SubstancesDao(database);
  final rows = await dao.getAll();
  return rows.map(_toDomain).toList();
}

@riverpod
Future<Substance?> substanceById(SubstanceByIdRef ref, int id) async {
  final database = ref.watch(databaseProvider);
  final dao = SubstancesDao(database);
  final row = await dao.getById(id);
  return row != null ? _toDomain(row) : null;
}

@riverpod
Future<List<Substance>> searchSubstances(
  SearchSubstancesRef ref,
  String query,
) async {
  final database = ref.watch(databaseProvider);
  final dao = SubstancesDao(database);
  final rows = await dao.search(query);
  return rows.map(_toDomain).toList();
}

@riverpod
Future<void> deleteSubstance(DeleteSubstanceRef ref, int id) async {
  final database = ref.watch(databaseProvider);
  await SubstancesDao(database).deleteSubstance(id);
  ref.invalidate(watchSubstancesProvider);
  ref.invalidate(substanceByIdProvider(id));
}

@riverpod
class SubstanceForm extends _$SubstanceForm {
  @override
  Future<void> build() async {}

  Future<void> create(Substance substance) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final database = ref.read(databaseProvider);
      final companion = _toInsertCompanion(substance);
      await SubstancesDao(database).insert(companion);
      ref.invalidate(watchSubstancesProvider);
    });
  }

  Future<void> updateSubstance(Substance substance) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final database = ref.read(databaseProvider);
      final companion = _toCompanion(substance);
      await SubstancesDao(database).replaceSubstance(companion);
      ref.invalidate(watchSubstancesProvider);
      ref.invalidate(substanceByIdProvider(substance.id));
    });
  }
}
