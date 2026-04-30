import 'package:drift/drift.dart' show Value;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/data/formulations_dao.dart';
import 'package:hydrobuddy/domain/models/formulation.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';

part 'formulations_provider.g.dart';

Formulation _driftToDomain(db.Formulation d) {
  return Formulation(
    id: d.id,
    name: d.name,
    description: null,
    createdAt: DateTime.parse(d.created_at),
    updatedAt: DateTime.parse(d.updated_at),
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
    volumeUnit: 'L',
    concUnit: d.units,
  );
}

db.FormulationsCompanion _domainToCompanion(
  Formulation f, {
  required String createdAt,
  required String updatedAt,
}) {
  return db.FormulationsCompanion(
    id: f.id > 0 ? Value(f.id) : const Value.absent(),
    name: Value(f.name),
    units: Value(f.concUnit),
    created_at: Value(createdAt),
    updated_at: Value(updatedAt),
    n_no3: Value(f.nNo3),
    n_nh4: Value(f.nNh4),
    p: Value(f.p),
    k: Value(f.k),
    ca: Value(f.ca),
    mg: Value(f.mg),
    s: Value(f.s),
    fe: Value(f.fe),
    mn: Value(f.mn),
    zn: Value(f.zn),
    b: Value(f.b),
    cu: Value(f.cu),
    si: Value(f.si),
    mo: Value(f.mo),
    na: Value(f.na),
    cl: Value(f.cl),
  );
}

final formulationsDaoProvider = Provider<FormulationsDao>(
  (ref) => FormulationsDao(ref.watch(databaseProvider)),
);

final snapshotsDaoProvider = Provider<SnapshotsDao>(
  (ref) => SnapshotsDao(ref.watch(databaseProvider)),
);

@riverpod
Future<List<Formulation>> watchFormulations(WatchFormulationsRef ref) async {
  final dao = ref.watch(formulationsDaoProvider);
  final list = await dao.getAll();
  return list.map(_driftToDomain).toList();
}

@riverpod
Future<Formulation?> formulationById(FormulationByIdRef ref, int id) async {
  final dao = ref.watch(formulationsDaoProvider);
  final d = await dao.getById(id);
  if (d == null) return null;
  return _driftToDomain(d);
}

@riverpod
class FormulationForm extends _$FormulationForm {
  @override
  Formulation? build() => null;

  void loadNew({
    String name = '',
    String concUnit = 'ppm',
  }) {
    final now = DateTime.now();
    state = Formulation(
      id: 0,
      name: name,
      createdAt: now,
      updatedAt: now,
      volumeUnit: 'L',
      concUnit: concUnit,
    );
  }

  void load(Formulation f) => state = f;

  void updateName(String name) =>
      state = state?.copyWith(name: name, updatedAt: DateTime.now());
  void updateConcUnit(String unit) =>
      state = state?.copyWith(concUnit: unit, updatedAt: DateTime.now());

  void updateNutrient({
    double nNo3 = 0.0,
    double nNh4 = 0.0,
    double p = 0.0,
    double k = 0.0,
    double ca = 0.0,
    double mg = 0.0,
    double s = 0.0,
    double fe = 0.0,
    double mn = 0.0,
    double zn = 0.0,
    double b = 0.0,
    double cu = 0.0,
    double si = 0.0,
    double mo = 0.0,
    double na = 0.0,
    double cl = 0.0,
  }) {
    state = state?.copyWith(
      nNo3: nNo3,
      nNh4: nNh4,
      p: p,
      k: k,
      ca: ca,
      mg: mg,
      s: s,
      fe: fe,
      mn: mn,
      zn: zn,
      b: b,
      cu: cu,
      si: si,
      mo: mo,
      na: na,
      cl: cl,
      updatedAt: DateTime.now(),
    );
  }

  Future<Formulation> save() async {
    final f = state;
    if (f == null) throw StateError('Form not initialized');
    final dao = ref.read(formulationsDaoProvider);
    final now = DateTime.now();
    final nowStr = now.toIso8601String();

    if (f.id <= 0) {
      final companion = _domainToCompanion(
        f,
        createdAt: nowStr,
        updatedAt: nowStr,
      ).copyWith(id: const Value.absent());
      final id = await dao.insert(companion);
      state = f.copyWith(id: id, createdAt: now, updatedAt: now);
      ref.invalidate(watchFormulationsProvider);
      return state!;
    } else {
      final companion = _domainToCompanion(
        f,
        createdAt: f.createdAt.toIso8601String(),
        updatedAt: nowStr,
      );
      await dao.updateRow(companion);
      state = f.copyWith(updatedAt: now);
      ref.invalidate(watchFormulationsProvider);
      ref.invalidate(formulationByIdProvider(f.id));
      return state!;
    }
  }
}

@riverpod
Future<List<db.FormulationSnapshot>> watchSnapshots(
  WatchSnapshotsRef ref,
  int formulationId,
) async {
  final dao = ref.watch(snapshotsDaoProvider);
  return dao.getByFormulationId(formulationId);
}

@riverpod
Future<void> createSnapshot(
  CreateSnapshotRef ref, {
  required int formulationId,
  required String note,
  required String triggerType,
  required String snapshotData,
}) async {
  final dao = ref.read(snapshotsDaoProvider);
  final existing = await dao.getByFormulationId(formulationId);
  final version = existing.length + 1;
  final companion = db.FormulationSnapshotsCompanion.insert(
    formulation_id: formulationId,
    version: version,
    created_at: DateTime.now().toIso8601String(),
    note: Value(note),
    snapshot_data: snapshotData,
    trigger_type: triggerType,
  );
  await dao.insert(companion);
  ref.invalidate(watchSnapshotsProvider(formulationId));
}

@riverpod
Future<void> deleteFormulation(DeleteFormulationRef ref, int id) async {
  final dao = ref.read(formulationsDaoProvider);
  await dao.deleteRow(id);
  ref.invalidate(watchFormulationsProvider);
  ref.invalidate(formulationByIdProvider(id));
}
