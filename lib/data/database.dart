import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'tables.dart';
import 'dart:io';

part 'database.g.dart';

@DriftDatabase(tables: [
  Substances,
  Formulations,
  FormulationSnapshots,
  WaterQuality,
  TissueAnalysis,
  SubstancesUsed,
  TankBatches,
  TankUsageEvents,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'hydrobuddy.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
