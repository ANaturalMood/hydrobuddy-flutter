import 'package:drift/drift.dart' show Value;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/data/tank_dao.dart';
import 'package:hydrobuddy/domain/models/tank.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';

part 'tank_provider.g.dart';

TankBatch _toTankBatch(db.TankBatche row) => TankBatch(
      id: row.id,
      name: row.name,
      formulationId: row.formulation_id,
      volume: row.volume,
      volumeRemaining: row.volume_remaining,
      preparedAt: DateTime.parse(row.prepared_at),
      notes: row.notes,
    );

TankUsageEvent _toUsageEvent(db.TankUsageEvent row) => TankUsageEvent(
      id: row.id,
      tankBatchId: row.tank_batch_id,
      eventType: row.event_type,
      volume: row.volume,
      createdAt: DateTime.parse(row.created_at),
      notes: row.notes,
    );

SubstanceUsed _toSubstanceUsed(db.SubstancesUsedData row) => SubstanceUsed(
      id: row.id,
      substanceId: row.substance_id,
      weight: row.weight,
    );

// --- Tank Batches ---

@riverpod
Future<List<TankBatch>> watchTankBatches(WatchTankBatchesRef ref) async {
  final database = ref.watch(databaseProvider);
  final dao = TankBatchesDao(database);
  final rows = await dao.getAll();
  return rows.map(_toTankBatch).toList();
}

@riverpod
Future<TankBatch?> tankBatchById(TankBatchByIdRef ref, int id) async {
  final database = ref.watch(databaseProvider);
  final dao = TankBatchesDao(database);
  final row = await dao.getById(id);
  if (row == null) return null;
  return _toTankBatch(row);
}

class TankBatchFormState {
  final int? id;
  final String name;
  final int formulationId;
  final double volume;
  final double volumeRemaining;
  final DateTime preparedAt;
  final String? notes;

  TankBatchFormState({
    this.id,
    this.name = '',
    this.formulationId = 0,
    this.volume = 0,
    this.volumeRemaining = 0,
    this.notes,
    DateTime? preparedAt,
  }) : preparedAt = preparedAt ?? DateTime.now();

  TankBatchFormState copyWith({
    int? id,
    String? name,
    int? formulationId,
    double? volume,
    double? volumeRemaining,
    DateTime? preparedAt,
    Value<String?> notes = const Value.absent(),
  }) =>
      TankBatchFormState(
        id: id ?? this.id,
        name: name ?? this.name,
        formulationId: formulationId ?? this.formulationId,
        volume: volume ?? this.volume,
        volumeRemaining: volumeRemaining ?? this.volumeRemaining,
        preparedAt: preparedAt ?? this.preparedAt,
        notes: notes.present ? notes.value : this.notes,
      );
}

@riverpod
class TankBatchForm extends _$TankBatchForm {
  @override
  TankBatchFormState build() => TankBatchFormState();

  void setName(String name) => state = state.copyWith(name: name);
  void setFormulationId(int id) => state = state.copyWith(formulationId: id);
  void setVolume(double v) => state = state.copyWith(volume: v);
  void setVolumeRemaining(double v) =>
      state = state.copyWith(volumeRemaining: v);
  void setNotes(String? notes) =>
      state = state.copyWith(notes: Value(notes));
  void setPreparedAt(DateTime dt) => state = state.copyWith(preparedAt: dt);

  void loadForEdit(TankBatch batch) {
    state = TankBatchFormState(
      id: batch.id,
      name: batch.name,
      formulationId: batch.formulationId,
      volume: batch.volume,
      volumeRemaining: batch.volumeRemaining,
      preparedAt: batch.preparedAt,
      notes: batch.notes,
    );
  }

  void reset() => state = TankBatchFormState();

  Future<void> save() async {
    final database = ref.read(databaseProvider);
    final dao = TankBatchesDao(database);
    final s = state;
    final companion = db.TankBatchesCompanion(
      name: Value(s.name),
      formulation_id: Value(s.formulationId),
      volume: Value(s.volume),
      volume_remaining: Value(s.volumeRemaining),
      prepared_at: Value(s.preparedAt.toIso8601String()),
      notes: s.notes == null ? const Value.absent() : Value(s.notes),
    );
    if (s.id == null) {
      await dao.insert(companion);
    } else {
      final id = s.id!;
      await dao.updateRow(companion.copyWith(id: Value(id)));
      ref.invalidate(tankBatchByIdProvider(id));
    }
    ref.invalidate(watchTankBatchesProvider);
    reset();
  }
}

@riverpod
Future<void> deleteTankBatch(DeleteTankBatchRef ref, int id) async {
  final database = ref.read(databaseProvider);
  final dao = TankBatchesDao(database);
  await dao.deleteRow(id);
  ref.invalidate(watchTankBatchesProvider);
  ref.invalidate(tankBatchByIdProvider(id));
}

// --- Tank Usage Events ---

@riverpod
Future<List<TankUsageEvent>> watchUsageEvents(
  WatchUsageEventsRef ref,
  int tankBatchId,
) async {
  final database = ref.watch(databaseProvider);
  final dao = TankUsageEventsDao(database);
  final rows = await dao.getByTankId(tankBatchId);
  return rows.map(_toUsageEvent).toList();
}

@riverpod
Future<void> addUsageEvent(
  AddUsageEventRef ref,
  int tankBatchId,
  String eventType,
  double volume,
  String? notes,
) async {
  final database = ref.read(databaseProvider);
  final dao = TankUsageEventsDao(database);
  await dao.insert(
    db.TankUsageEventsCompanion.insert(
      tank_batch_id: tankBatchId,
      event_type: eventType,
      volume: volume,
      created_at: DateTime.now().toIso8601String(),
      notes: notes == null ? const Value.absent() : Value(notes),
    ),
  );
  ref.invalidate(watchUsageEventsProvider(tankBatchId));
}

// --- Substances Used ---

@riverpod
Future<List<SubstanceUsed>> watchSubstancesUsed(
  WatchSubstancesUsedRef ref,
) async {
  final database = ref.watch(databaseProvider);
  final dao = SubstancesUsedDao(database);
  final rows = await dao.getAll();
  return rows.map(_toSubstanceUsed).toList();
}

@riverpod
Future<void> addSubstanceUsed(
  AddSubstanceUsedRef ref,
  int substanceId,
  double weight,
) async {
  final database = ref.read(databaseProvider);
  final dao = SubstancesUsedDao(database);
  await dao.insert(
    db.SubstancesUsedCompanion.insert(
      substance_id: substanceId,
      weight: Value(weight),
    ),
  );
  ref.invalidate(watchSubstancesUsedProvider);
}
