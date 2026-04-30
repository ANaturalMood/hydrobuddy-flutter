import 'package:drift/drift.dart';
import 'database.dart';
import 'substances_dao.dart';

class SeedData {
  static Future<void> populate(AppDatabase db) async {
    final dao = SubstancesDao(db);
    final existing = await dao.getAll();
    if (existing.isNotEmpty) return;

    await db.batch((batch) {
      batch.insertAll(db.substances, [
        SubstancesCompanion.insert(name: 'Potassium Nitrate', formula: const Value('KNO3'), k: const Value(38.6), n_no3: const Value(13.9)),
        SubstancesCompanion.insert(name: 'Calcium Nitrate', formula: const Value('Ca(NO3)2'), ca: const Value(24.4), n_no3: const Value(17.1)),
        SubstancesCompanion.insert(name: 'Magnesium Sulfate', formula: const Value('MgSO4'), mg: const Value(20.2), s: const Value(26.6)),
        SubstancesCompanion.insert(name: 'Monopotassium Phosphate', formula: const Value('KH2PO4'), k: const Value(28.7), p: const Value(22.8)),
        SubstancesCompanion.insert(name: 'Potassium Sulfate', formula: const Value('K2SO4'), k: const Value(44.9), s: const Value(18.4)),
        SubstancesCompanion.insert(name: 'Ammonium Nitrate', formula: const Value('NH4NO3'), n_nh4: const Value(35.0), n_no3: const Value(35.0)),
        SubstancesCompanion.insert(name: 'Calcium Chloride', formula: const Value('CaCl2'), ca: const Value(36.1), cl: const Value(63.9)),
      ]);
    });
  }
}
