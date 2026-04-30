// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';

class Substances extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get formula => text().nullable()();
  TextColumn get source => text().nullable()();
  RealColumn get purity => real().withDefault(const Constant(1.0))();
  RealColumn get cost => real().withDefault(const Constant(0.0))();
  BoolColumn get is_liquid => boolean().withDefault(const Constant(false))();
  RealColumn get density => real().withDefault(const Constant(1.0))();
  TextColumn get conc_type => text().nullable()();
  RealColumn get n_no3 => real().withDefault(const Constant(0.0))();
  RealColumn get n_nh4 => real().withDefault(const Constant(0.0))();
  RealColumn get p => real().withDefault(const Constant(0.0))();
  RealColumn get k => real().withDefault(const Constant(0.0))();
  RealColumn get ca => real().withDefault(const Constant(0.0))();
  RealColumn get mg => real().withDefault(const Constant(0.0))();
  RealColumn get s => real().withDefault(const Constant(0.0))();
  RealColumn get fe => real().withDefault(const Constant(0.0))();
  RealColumn get mn => real().withDefault(const Constant(0.0))();
  RealColumn get zn => real().withDefault(const Constant(0.0))();
  RealColumn get b => real().withDefault(const Constant(0.0))();
  RealColumn get cu => real().withDefault(const Constant(0.0))();
  RealColumn get si => real().withDefault(const Constant(0.0))();
  RealColumn get mo => real().withDefault(const Constant(0.0))();
  RealColumn get na => real().withDefault(const Constant(0.0))();
  RealColumn get cl => real().withDefault(const Constant(0.0))();
}

class Formulations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get units => text().withDefault(const Constant('ppm'))();
  TextColumn get created_at => text()();
  TextColumn get updated_at => text()();
  RealColumn get n_no3 => real().withDefault(const Constant(0.0))();
  RealColumn get n_nh4 => real().withDefault(const Constant(0.0))();
  RealColumn get p => real().withDefault(const Constant(0.0))();
  RealColumn get k => real().withDefault(const Constant(0.0))();
  RealColumn get ca => real().withDefault(const Constant(0.0))();
  RealColumn get mg => real().withDefault(const Constant(0.0))();
  RealColumn get s => real().withDefault(const Constant(0.0))();
  RealColumn get fe => real().withDefault(const Constant(0.0))();
  RealColumn get mn => real().withDefault(const Constant(0.0))();
  RealColumn get zn => real().withDefault(const Constant(0.0))();
  RealColumn get b => real().withDefault(const Constant(0.0))();
  RealColumn get cu => real().withDefault(const Constant(0.0))();
  RealColumn get si => real().withDefault(const Constant(0.0))();
  RealColumn get mo => real().withDefault(const Constant(0.0))();
  RealColumn get na => real().withDefault(const Constant(0.0))();
  RealColumn get cl => real().withDefault(const Constant(0.0))();
}

class FormulationSnapshots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get formulation_id => integer().references(Formulations, #id, onDelete: KeyAction.cascade)();
  IntColumn get version => integer()();
  TextColumn get created_at => text()();
  TextColumn get note => text().nullable()();
  TextColumn get snapshot_data => text()();
  TextColumn get trigger_type => text()();
  IntColumn get parent_snapshot_id => integer().nullable()();
}

class WaterQuality extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get is_default => boolean().withDefault(const Constant(false))();
  RealColumn get ph => real().nullable()();
  RealColumn get gh => real().nullable()();
  RealColumn get kh => real().nullable()();
  RealColumn get n_no3 => real().withDefault(const Constant(0.0))();
  RealColumn get n_nh4 => real().withDefault(const Constant(0.0))();
  RealColumn get p => real().withDefault(const Constant(0.0))();
  RealColumn get k => real().withDefault(const Constant(0.0))();
  RealColumn get ca => real().withDefault(const Constant(0.0))();
  RealColumn get mg => real().withDefault(const Constant(0.0))();
  RealColumn get s => real().withDefault(const Constant(0.0))();
  RealColumn get fe => real().withDefault(const Constant(0.0))();
  RealColumn get mn => real().withDefault(const Constant(0.0))();
  RealColumn get zn => real().withDefault(const Constant(0.0))();
  RealColumn get b => real().withDefault(const Constant(0.0))();
  RealColumn get cu => real().withDefault(const Constant(0.0))();
  RealColumn get si => real().withDefault(const Constant(0.0))();
  RealColumn get mo => real().withDefault(const Constant(0.0))();
  RealColumn get na => real().withDefault(const Constant(0.0))();
  RealColumn get cl => real().withDefault(const Constant(0.0))();
}

class TissueAnalysis extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get n => real().withDefault(const Constant(0.0))();
  RealColumn get p => real().withDefault(const Constant(0.0))();
  RealColumn get k => real().withDefault(const Constant(0.0))();
  RealColumn get ca => real().withDefault(const Constant(0.0))();
  RealColumn get mg => real().withDefault(const Constant(0.0))();
  RealColumn get s => real().withDefault(const Constant(0.0))();
  RealColumn get fe => real().withDefault(const Constant(0.0))();
  RealColumn get mn => real().withDefault(const Constant(0.0))();
  RealColumn get zn => real().withDefault(const Constant(0.0))();
  RealColumn get b => real().withDefault(const Constant(0.0))();
  RealColumn get cu => real().withDefault(const Constant(0.0))();
  RealColumn get si => real().withDefault(const Constant(0.0))();
  RealColumn get mo => real().withDefault(const Constant(0.0))();
  RealColumn get na => real().withDefault(const Constant(0.0))();
  RealColumn get cl => real().withDefault(const Constant(0.0))();
}

class SubstancesUsed extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get substance_id => integer().references(Substances, #id)();
  RealColumn get weight => real().nullable()();
}

class TankBatches extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get formulation_id => integer().references(Formulations, #id)();
  RealColumn get volume => real()();
  RealColumn get volume_remaining => real()();
  TextColumn get prepared_at => text()();
  TextColumn get notes => text().nullable()();
}

class TankUsageEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tank_batch_id => integer().references(TankBatches, #id, onDelete: KeyAction.cascade)();
  TextColumn get event_type => text()();
  RealColumn get volume => real()();
  TextColumn get created_at => text()();
  TextColumn get notes => text().nullable()();
}
