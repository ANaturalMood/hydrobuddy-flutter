import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/data/formulations_dao.dart';
import 'package:hydrobuddy/domain/models/formulation.dart';
import 'package:hydrobuddy/ui/providers/formulations_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockFormulationsDao extends Mock implements FormulationsDao {}

class MockSnapshotsDao extends Mock implements SnapshotsDao {}

db.Formulation _makeDriftFormulation({
  int id = 1,
  String name = 'Test Formula',
  String units = 'ppm',
  String createdAt = '2025-01-01T00:00:00.000',
  String updatedAt = '2025-01-02T00:00:00.000',
  double nNo3 = 100.0,
  double nNh4 = 10.0,
  double p = 50.0,
  double k = 200.0,
  double ca = 150.0,
  double mg = 50.0,
  double s = 30.0,
  double fe = 2.0,
  double mn = 0.5,
  double zn = 0.1,
  double b = 0.3,
  double cu = 0.05,
  double si = 0.0,
  double mo = 0.05,
  double na = 0.0,
  double cl = 0.0,
}) {
  return db.Formulation(
    id: id,
    name: name,
    units: units,
    created_at: createdAt,
    updated_at: updatedAt,
    n_no3: nNo3,
    n_nh4: nNh4,
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
  );
}

db.FormulationSnapshot _makeDriftSnapshot({
  int id = 1,
  int formulationId = 1,
  int version = 1,
  String createdAt = '2025-01-01T00:00:00.000',
  String note = '',
  String snapshotData = '{}',
  String triggerType = 'manual',
  int? parentSnapshotId,
}) {
  return db.FormulationSnapshot(
    id: id,
    formulation_id: formulationId,
    version: version,
    created_at: createdAt,
    note: note,
    snapshot_data: snapshotData,
    trigger_type: triggerType,
    parent_snapshot_id: parentSnapshotId,
  );
}

void main() {
  late ProviderContainer container;
  late MockFormulationsDao mockFormulationsDao;
  late MockSnapshotsDao mockSnapshotsDao;

  setUp(() {
    mockFormulationsDao = MockFormulationsDao();
    mockSnapshotsDao = MockSnapshotsDao();

    container = ProviderContainer(
      overrides: [
        formulationsDaoProvider.overrideWithValue(mockFormulationsDao),
        snapshotsDaoProvider.overrideWithValue(mockSnapshotsDao),
      ],
    );

    registerFallbackValue(db.FormulationsCompanion(
      name: const Value.absent(),
    ));
    registerFallbackValue(db.FormulationSnapshotsCompanion(
      formulation_id: const Value.absent(),
      version: const Value.absent(),
      created_at: const Value.absent(),
      snapshot_data: const Value.absent(),
      trigger_type: const Value.absent(),
    ));
  });

  tearDown(() => container.dispose());

  group('watchFormulations', () {
    test('returns domain Formulation list mapped from Drift', () async {
      final driftList = [
        _makeDriftFormulation(id: 1, name: 'A', nNo3: 100),
        _makeDriftFormulation(id: 2, name: 'B', nNo3: 200),
      ];
      when(() => mockFormulationsDao.getAll()).thenAnswer((_) async => driftList);

      final result = await container.read(watchFormulationsProvider.future);

      expect(result.length, 2);
      expect(result[0], isA<Formulation>());
      expect(result[0].id, 1);
      expect(result[0].name, 'A');
      expect(result[0].nNo3, 100.0);
      expect(result[0].concUnit, 'ppm');
      expect(result[0].volumeUnit, 'L');
      expect(result[0].description, isNull);
      expect(result[0].createdAt, DateTime.parse('2025-01-01T00:00:00.000'));
      expect(result[0].updatedAt, DateTime.parse('2025-01-02T00:00:00.000'));
      expect(result[1].id, 2);
      expect(result[1].name, 'B');
    });

    test('returns empty list when no formulations', () async {
      when(() => mockFormulationsDao.getAll()).thenAnswer((_) async => []);

      final result = await container.read(watchFormulationsProvider.future);

      expect(result, isEmpty);
    });
  });

  group('formulationById', () {
    test('returns domain Formulation when found', () async {
      final driftForm = _makeDriftFormulation(id: 42, name: 'My Formula', nNo3: 150);
      when(() => mockFormulationsDao.getById(42)).thenAnswer((_) async => driftForm);

      final result = await container.read(formulationByIdProvider(42).future);

      expect(result, isNotNull);
      expect(result!.id, 42);
      expect(result.name, 'My Formula');
      expect(result.nNo3, 150.0);
    });

    test('returns null when not found', () async {
      when(() => mockFormulationsDao.getById(999)).thenAnswer((_) async => null);

      final result = await container.read(formulationByIdProvider(999).future);

      expect(result, isNull);
    });
  });

  group('deleteFormulation', () {
    test('calls dao.deleteRow and invalidates providers', () async {
      when(() => mockFormulationsDao.deleteRow(1)).thenAnswer((_) async => 1);
      when(() => mockFormulationsDao.getAll()).thenAnswer((_) async => []);
      when(() => mockFormulationsDao.getById(1)).thenAnswer((_) async => null);

      await container.read(deleteFormulationProvider(1).future);

      verify(() => mockFormulationsDao.deleteRow(1)).called(1);

      final list = await container.read(watchFormulationsProvider.future);
      expect(list, isEmpty);
    });
  });

  group('watchSnapshots', () {
    test('returns snapshots for a formulation', () async {
      final snapshots = [
        _makeDriftSnapshot(id: 1, version: 1, snapshotData: 'v1'),
        _makeDriftSnapshot(id: 2, version: 2, snapshotData: 'v2'),
      ];
      when(() => mockSnapshotsDao.getByFormulationId(1)).thenAnswer(
        (_) async => snapshots,
      );

      final result = await container.read(watchSnapshotsProvider(1).future);

      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].version, 1);
      expect(result[0].snapshot_data, 'v1');
      expect(result[1].id, 2);
      expect(result[1].version, 2);
    });
  });

  group('createSnapshot', () {
    test('inserts snapshot and invalidates watchSnapshots', () async {
      final existingSnapshots = [_makeDriftSnapshot(id: 1, version: 1)];
      when(() => mockSnapshotsDao.getByFormulationId(1)).thenAnswer(
        (_) async => existingSnapshots,
      );
      when(
        () => mockSnapshotsDao.insert(any()),
      ).thenAnswer((_) async => 2);

      await container.read(
        createSnapshotProvider(
          formulationId: 1,
          note: 'Test note',
          triggerType: 'manual',
          snapshotData: '{"nNo3":100}',
        ).future,
      );

      final captured = verify(() => mockSnapshotsDao.insert(captureAny()))
          .captured;
      expect(captured.length, 1);
      final companion = captured.single as db.FormulationSnapshotsCompanion;
      expect(companion.formulation_id.value, 1);
      expect(companion.version.value, 2);
      expect(companion.note.value, 'Test note');
      expect(companion.trigger_type.value, 'manual');
      expect(companion.snapshot_data.value, '{"nNo3":100}');
    });
  });

  group('FormulationForm', () {
    test('initial state is null', () {
      final notifier = container.read(formulationFormProvider.notifier);
      expect(notifier.state, isNull);
    });

    test('loadNew sets a blank form with concUnit = ppm', () {
      final notifier = container.read(formulationFormProvider.notifier);
      notifier.loadNew(name: 'New Form', concUnit: 'ppm');

      final form = notifier.state;
      expect(form, isNotNull);
      expect(form!.id, 0);
      expect(form.name, 'New Form');
      expect(form.concUnit, 'ppm');
      expect(form.volumeUnit, 'L');
      expect(form.nNo3, 0.0);
      expect(form.description, isNull);
    });

    test('load sets state to existing Formulation', () {
      final existing = Formulation(
        id: 5,
        name: 'Existing',
        createdAt: DateTime(2025, 1, 1),
        updatedAt: DateTime(2025, 1, 2),
        volumeUnit: 'L',
        concUnit: 'ppm',
        nNo3: 150,
      );

      final notifier = container.read(formulationFormProvider.notifier);
      notifier.load(existing);

      expect(notifier.state?.id, 5);
      expect(notifier.state?.name, 'Existing');
      expect(notifier.state?.nNo3, 150);
    });

    test('updateName modifies name and updatedAt', () {
      final notifier = container.read(formulationFormProvider.notifier);
      notifier.loadNew(name: 'Old');
      final beforeUpdate = notifier.state!.updatedAt;
      notifier.updateName('New Name');

      expect(notifier.state?.name, 'New Name');
      expect(
        notifier.state!.updatedAt.isAfter(beforeUpdate) ||
            notifier.state!.updatedAt.isAtSameMomentAs(beforeUpdate),
        isTrue,
      );
    });

    test('updateNutrient modifies nutrient values', () {
      final notifier = container.read(formulationFormProvider.notifier);
      notifier.loadNew(name: 'Test');

      notifier.updateNutrient(nNo3: 200, nNh4: 50, p: 80);

      expect(notifier.state?.nNo3, 200);
      expect(notifier.state?.nNh4, 50);
      expect(notifier.state?.p, 80);
      expect(notifier.state?.k, 0.0);
    });

    test('save creates new formulation', () async {
      when(
        () => mockFormulationsDao.insert(any()),
      ).thenAnswer((_) async => 10);

      final notifier = container.read(formulationFormProvider.notifier);
      notifier.loadNew(name: 'Created', concUnit: 'ppm');
      notifier.updateNutrient(nNo3: 120, k: 300);

      final saved = await notifier.save();

      expect(saved.id, 10);
      expect(saved.name, 'Created');
      expect(saved.nNo3, 120);
      expect(saved.k, 300);

      final captured = verify(() => mockFormulationsDao.insert(captureAny()))
          .captured;
      expect(captured.length, 1);
      final companion = captured.single as db.FormulationsCompanion;
      expect(companion.name.value, 'Created');
      expect(companion.n_no3.value, 120);
      expect(companion.k.value, 300);
      expect(companion.id.present, false);
    });

    test('save updates existing formulation', () async {
      when(
        () => mockFormulationsDao.updateRow(any()),
      ).thenAnswer((_) async => true);

      final notifier = container.read(formulationFormProvider.notifier);
      final existing = Formulation(
        id: 7,
        name: 'Before',
        createdAt: DateTime(2025, 1, 1),
        updatedAt: DateTime(2025, 1, 1),
        volumeUnit: 'L',
        concUnit: 'ppm',
        nNo3: 100,
      );
      notifier.load(existing);
      notifier.updateName('After');
      notifier.updateNutrient(nNo3: 200);

      final saved = await notifier.save();

      expect(saved.id, 7);
      expect(saved.name, 'After');
      expect(saved.nNo3, 200);

      final captured = verify(() => mockFormulationsDao.updateRow(captureAny()))
          .captured;
      expect(captured.length, 1);
      final companion = captured.single as db.FormulationsCompanion;
      expect(companion.id.value, 7);
      expect(companion.name.value, 'After');
      expect(companion.n_no3.value, 200);
    });

    test('save throws StateError when form not initialized', () {
      final notifier = container.read(formulationFormProvider.notifier);

      expect(() => notifier.save(), throwsStateError);
    });
  });
}
