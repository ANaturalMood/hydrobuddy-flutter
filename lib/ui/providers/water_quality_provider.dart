import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/data/water_quality_dao.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'water_quality_provider.g.dart';

@riverpod
Future<List<db.WaterQualityData>> watchWaterQualities(WatchWaterQualitiesRef ref) async {
  final database = ref.watch(databaseProvider);
  final dao = WaterQualityDao(database);
  return dao.getAll();
}

@riverpod
Future<db.WaterQualityData?> waterQualityById(WaterQualityByIdRef ref, int id) async {
  final database = ref.watch(databaseProvider);
  final dao = WaterQualityDao(database);
  final all = await dao.getAll();
  final matches = all.where((w) => w.id == id).toList();
  return matches.isNotEmpty ? matches.first : null;
}

@riverpod
class WaterQualityForm extends _$WaterQualityForm {
  @override
  Future<void> build() async {}

  Future<void> create(db.WaterQualityCompanion companion) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final database = ref.read(databaseProvider);
      await WaterQualityDao(database).insert(companion);
      ref.invalidate(watchWaterQualitiesProvider);
    });
  }

  Future<void> updateWaterQuality(db.WaterQualityCompanion companion) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final database = ref.read(databaseProvider);
      await WaterQualityDao(database).updateRow(companion);
      ref.invalidate(watchWaterQualitiesProvider);
      if (companion.id.present) {
        ref.invalidate(waterQualityByIdProvider(companion.id.value));
      }
    });
  }
}

@riverpod
Future<void> deleteWaterQuality(DeleteWaterQualityRef ref, int id) async {
  final database = ref.watch(databaseProvider);
  await WaterQualityDao(database).deleteRow(id);
  ref.invalidate(watchWaterQualitiesProvider);
  ref.invalidate(waterQualityByIdProvider(id));
}

@riverpod
Future<List<db.TissueAnalysi>> watchTissues(WatchTissuesRef ref) async {
  final database = ref.watch(databaseProvider);
  final dao = TissueDao(database);
  return dao.getAll();
}

@riverpod
Future<db.TissueAnalysi?> tissueById(TissueByIdRef ref, int id) async {
  final database = ref.watch(databaseProvider);
  final dao = TissueDao(database);
  final all = await dao.getAll();
  final matches = all.where((t) => t.id == id).toList();
  return matches.isNotEmpty ? matches.first : null;
}

@riverpod
class TissueForm extends _$TissueForm {
  @override
  Future<void> build() async {}

  Future<void> create(db.TissueAnalysisCompanion companion) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final database = ref.read(databaseProvider);
      await TissueDao(database).insert(companion);
      ref.invalidate(watchTissuesProvider);
    });
  }

  Future<void> updateTissue(db.TissueAnalysisCompanion companion) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final database = ref.read(databaseProvider);
      await TissueDao(database).updateRow(companion);
      ref.invalidate(watchTissuesProvider);
      if (companion.id.present) {
        ref.invalidate(tissueByIdProvider(companion.id.value));
      }
    });
  }
}

@riverpod
Future<void> deleteTissue(DeleteTissueRef ref, int id) async {
  final database = ref.watch(databaseProvider);
  await TissueDao(database).deleteRow(id);
  ref.invalidate(watchTissuesProvider);
  ref.invalidate(tissueByIdProvider(id));
}
