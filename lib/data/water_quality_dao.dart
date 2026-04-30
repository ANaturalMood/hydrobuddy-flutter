import 'package:drift/drift.dart';
import 'database.dart';
import 'tables.dart';

part 'water_quality_dao.g.dart';

@DriftAccessor(tables: [WaterQuality])
class WaterQualityDao extends DatabaseAccessor<AppDatabase> with _$WaterQualityDaoMixin {
  WaterQualityDao(AppDatabase db) : super(db);

  Future<List<WaterQualityData>> getAll() => select(waterQuality).get();
  Future<WaterQualityData?> getDefault() => (select(waterQuality)..where((t) => t.is_default.equals(true))..limit(1)).getSingleOrNull();
  Future<int> insert(WaterQualityCompanion data) => into(waterQuality).insert(data);
  Future<bool> updateRow(WaterQualityCompanion data) => update(waterQuality).replace(data);
  Future<int> deleteRow(int id) => (delete(waterQuality)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [TissueAnalysis])
class TissueDao extends DatabaseAccessor<AppDatabase> with _$TissueDaoMixin {
  TissueDao(AppDatabase db) : super(db);

  Future<List<TissueAnalysi>> getAll() => select(tissueAnalysis).get();
  Future<int> insert(TissueAnalysisCompanion data) => into(tissueAnalysis).insert(data);
  Future<bool> updateRow(TissueAnalysisCompanion data) => update(tissueAnalysis).replace(data);
  Future<int> deleteRow(int id) => (delete(tissueAnalysis)..where((t) => t.id.equals(id))).go();
}
