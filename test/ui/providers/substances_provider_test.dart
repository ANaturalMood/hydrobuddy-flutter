import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/data/database.dart' hide Substance;
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';

AppDatabase _testDb() => AppDatabase.forTesting(NativeDatabase.memory());

ProviderContainer _container() {
  final db = _testDb();
  final container = ProviderContainer(
    overrides: [databaseProvider.overrideWithValue(db)],
  );
  addTearDown(() async {
    await db.close();
    container.dispose();
  });
  return container;
}

void main() {
  group('watchSubstances', () {
    test('returns empty list initially', () async {
      final container = _container();
      final substances = await container.read(watchSubstancesProvider.future);
      expect(substances, isEmpty);
    });

    test('reflects newly created substance', () async {
      final container = _container();
      final form = container.read(substanceFormProvider.notifier);

      await form.create(Substance(id: 0, name: 'KNO3', k: 38.0, nNo3: 13.0));

      final substances = await container.read(watchSubstancesProvider.future);
      expect(substances.length, 1);
      expect(substances.first.name, 'KNO3');
      expect(substances.first.k, 38.0);
      expect(substances.first.nNo3, 13.0);
    });
  });

  group('substanceById', () {
    test('returns null for missing id', () async {
      final container = _container();
      final result = await container.read(substanceByIdProvider(999).future);
      expect(result, isNull);
    });

    test('returns substance for existing id', () async {
      final container = _container();
      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'KNO3', k: 38.0, nNo3: 13.0));

      final substances = await container.read(watchSubstancesProvider.future);
      final id = substances.first.id;
      final found = await container.read(substanceByIdProvider(id).future);
      expect(found, isNotNull);
      expect(found!.name, 'KNO3');
    });
  });

  group('searchSubstances', () {
    test('finds substance by name', () async {
      final container = _container();
      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'KNO3', k: 38.0));
      await form.create(Substance(id: 0, name: 'MAP', p: 27.0));

      final results = await container.read(
        searchSubstancesProvider('KNO3').future,
      );
      expect(results.length, 1);
      expect(results.first.name, 'KNO3');
    });

    test('returns empty for no match', () async {
      final container = _container();
      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'KNO3', k: 38.0));

      final results = await container.read(
        searchSubstancesProvider('XYZ').future,
      );
      expect(results, isEmpty);
    });
  });

  group('deleteSubstance', () {
    test('removes substance and updates watchSubstances', () async {
      final container = _container();
      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'KNO3', k: 38.0));
      await form.create(Substance(id: 0, name: 'MAP', p: 27.0));

      final before = await container.read(watchSubstancesProvider.future);
      expect(before.length, 2);
      final idToDelete = before.first.id;

      await container.read(deleteSubstanceProvider(idToDelete).future);

      final after = await container.read(watchSubstancesProvider.future);
      expect(after.length, 1);
      expect(after.first.name, 'MAP');
    });
  });

  group('SubstanceForm update', () {
    test('updates existing substance', () async {
      final container = _container();
      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'KNO3', k: 38.0));

      final substances = await container.read(watchSubstancesProvider.future);
      final existing = substances.first;

      await form.updateSubstance(existing.copyWith(name: 'KNO3-Updated', k: 40.0));

      final updated = await container.read(watchSubstancesProvider.future);
      expect(updated.first.name, 'KNO3-Updated');
      expect(updated.first.k, 40.0);
    });
  });

  group('all fields mapping', () {
    test('persists and reads back all 25 fields', () async {
      final container = _container();
      final form = container.read(substanceFormProvider.notifier);

      await form.create(
        Substance(
          id: 0,
          name: 'Full Test',
          formula: 'H2O',
          source: 'Lab',
          purity: 0.99,
          cost: 12.5,
          isLiquid: true,
          density: 1.33,
          concType: 'w/w',
          nNo3: 1.0,
          nNh4: 2.0,
          p: 3.0,
          k: 4.0,
          ca: 5.0,
          mg: 6.0,
          s: 7.0,
          fe: 8.0,
          mn: 9.0,
          zn: 10.0,
          b: 11.0,
          cu: 12.0,
          si: 13.0,
          mo: 14.0,
          na: 15.0,
          cl: 16.0,
        ),
      );

      final substances = await container.read(watchSubstancesProvider.future);
      expect(substances.length, 1);
      final s = substances.first;
      expect(s.name, 'Full Test');
      expect(s.formula, 'H2O');
      expect(s.source, 'Lab');
      expect(s.purity, 0.99);
      expect(s.cost, 12.5);
      expect(s.isLiquid, true);
      expect(s.density, 1.33);
      expect(s.concType, 'w/w');
      expect(s.nNo3, 1.0);
      expect(s.nNh4, 2.0);
      expect(s.p, 3.0);
      expect(s.k, 4.0);
      expect(s.ca, 5.0);
      expect(s.mg, 6.0);
      expect(s.s, 7.0);
      expect(s.fe, 8.0);
      expect(s.mn, 9.0);
      expect(s.zn, 10.0);
      expect(s.b, 11.0);
      expect(s.cu, 12.0);
      expect(s.si, 13.0);
      expect(s.mo, 14.0);
      expect(s.na, 15.0);
      expect(s.cl, 16.0);
    });
  });
}
