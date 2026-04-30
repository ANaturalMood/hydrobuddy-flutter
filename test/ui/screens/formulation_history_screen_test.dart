import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/data/database.dart' as drift_db;
import 'package:hydrobuddy/data/formulations_dao.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/formulations_provider.dart';
import 'package:hydrobuddy/ui/screens/formulation_history_screen.dart';
import 'package:hydrobuddy/ui/widgets/snapshot_timeline.dart';

drift_db.AppDatabase _testDb() => drift_db.AppDatabase.forTesting(NativeDatabase.memory());

Widget _wrap(Widget child, {drift_db.AppDatabase? db}) {
  final database = db ?? _testDb();
  return ProviderScope(
    overrides: [databaseProvider.overrideWithValue(database)],
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pt'),
      home: child,
    ),
  );
}

Future<ProviderContainer> _seedFormulations(drift_db.AppDatabase database, List<String> names) async {
  final container = ProviderContainer(
    overrides: [databaseProvider.overrideWithValue(database)],
  );
  for (final name in names) {
    final notifier = container.read(formulationFormProvider.notifier);
    notifier.loadNew(name: name);
    notifier.updateNutrient(nNo3: 100, k: 200);
    await notifier.save();
  }
  return container;
}

void main() {
  testWidgets('renders empty list message when no formulations', (tester) async {
    final db = _testDb();
    addTearDown(() async => db.close());

    await tester.pumpWidget(_wrap(const FormulationHistoryScreen(), db: db));
    await tester.pumpAndSettle();

    expect(find.text('Nenhuma formulação cadastrada'), findsOneWidget);
  });

  testWidgets('renders formulation cards with data', (tester) async {
    final db = _testDb();
    addTearDown(() async => db.close());

    final container = await _seedFormulations(db, ['Tomate Vegetativo', 'Alface Hidropônica']);
    addTearDown(container.dispose);

    await tester.pumpWidget(_wrap(const FormulationHistoryScreen(), db: db));
    await tester.pumpAndSettle();

    expect(find.text('Tomate Vegetativo'), findsOneWidget);
    expect(find.text('Alface Hidropônica'), findsOneWidget);
  });

  testWidgets('swipe delete shows confirmation dialog', (tester) async {
    final db = _testDb();
    addTearDown(() async => db.close());

    final container = await _seedFormulations(db, ['Test Formula']);
    addTearDown(container.dispose);

    await tester.pumpWidget(_wrap(const FormulationHistoryScreen(), db: db));
    await tester.pumpAndSettle();

    final dismissible = find.byType(Dismissible);
    expect(dismissible, findsOneWidget);

    await tester.drag(dismissible, const Offset(-500, 0));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Excluir Formulação'), findsOneWidget);
    expect(find.text('Deseja excluir "Test Formula"?'), findsOneWidget);
  });

  group('SnapshotTimeline', () {
    testWidgets('renders empty state when no snapshots', (tester) async {
      final db = _testDb();
      addTearDown(() async => db.close());

      final container = await _seedFormulations(db, ['Test Form']);
      addTearDown(container.dispose);

      await tester.pumpWidget(_wrap(
        const SnapshotTimeline(formulationId: 1),
        db: db,
      ));
      await tester.pumpAndSettle();

      expect(find.text('Histórico: Test Form'), findsOneWidget);
      expect(find.text('Nenhum snapshot registrado'), findsOneWidget);
    });

    testWidgets('renders with snapshots showing data', (tester) async {
      final db = _testDb();
      addTearDown(() async => db.close());

      final container = await _seedFormulations(db, ['Tomate Veg']);
      addTearDown(container.dispose);

      final dao = SnapshotsDao(db);
      await dao.insert(drift_db.FormulationSnapshotsCompanion.insert(
        formulation_id: 1,
        version: 1,
        created_at: '2025-04-28T14:32:00.000',
        note: Value('Aumentei N em 15%'),
        snapshot_data: '{"nNo3":210,"k":230,"p":40,"mg":50}',
        trigger_type: 'manual',
      ));
      await dao.insert(drift_db.FormulationSnapshotsCompanion.insert(
        formulation_id: 1,
        version: 2,
        created_at: '2025-04-28T10:15:00.000',
        note: const Value.absent(),
        snapshot_data: '{"nNo3":180,"k":250,"p":40,"mg":50}',
        trigger_type: 'auto_save',
      ));

      await tester.pumpWidget(_wrap(
        const SnapshotTimeline(formulationId: 1),
        db: db,
      ));
      await tester.pumpAndSettle();

      expect(find.text('Aumentei N em 15%'), findsOneWidget);
      expect(find.textContaining('14:32'), findsOneWidget);
      expect(find.textContaining('10:15'), findsOneWidget);
      expect(find.text('Restaurar'), findsAtLeastNWidgets(2));
    });

    testWidgets('FAB opens new snapshot dialog', (tester) async {
      final db = _testDb();
      addTearDown(() async => db.close());

      final container = await _seedFormulations(db, ['Test']);
      addTearDown(container.dispose);

      await tester.pumpWidget(_wrap(
        const SnapshotTimeline(formulationId: 1),
        db: db,
      ));
      await tester.pumpAndSettle();

      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      await tester.tap(fab);
      await tester.pumpAndSettle();

      expect(find.text('Novo Snapshot'), findsOneWidget);
      expect(find.text('Salvar'), findsOneWidget);
      expect(find.text('Cancelar'), findsOneWidget);
    });
  });

  testWidgets('FAB opens create formulation dialog', (tester) async {
    final db = _testDb();
    addTearDown(() async => db.close());

    await tester.pumpWidget(_wrap(const FormulationHistoryScreen(), db: db));
    await tester.pumpAndSettle();

    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);

    await tester.tap(fab);
    await tester.pumpAndSettle();

    expect(find.text('Nova Formulação'), findsOneWidget);
    expect(find.text('Criar'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);
  });
}
