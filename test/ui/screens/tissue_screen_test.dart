import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';
import 'package:hydrobuddy/ui/screens/tissue_screen.dart';
import 'package:hydrobuddy/ui/screens/tissue_editor_screen.dart';

db.AppDatabase _testDb() =>
    db.AppDatabase.forTesting(NativeDatabase.memory());

ProviderContainer _makeContainer(db.AppDatabase database) {
  return ProviderContainer(
    overrides: [databaseProvider.overrideWithValue(database)],
  );
}

Future<void> _dispose(ProviderContainer container, db.AppDatabase database) async {
  container.dispose();
  await database.close();
}

GoRouter _testRouter() {
  return GoRouter(
    initialLocation: '/tissue',
    routes: [
      GoRoute(
        path: '/tissue',
        builder: (context, state) => const TissueScreen(),
        routes: [
          GoRoute(
            path: 'edit/:id',
            builder: (context, state) => TissueEditorScreen(
              tissueId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: 'new',
            builder: (context, state) => const TissueEditorScreen(),
          ),
        ],
      ),
    ],
  );
}

void main() {
  group('TissueScreen', () {
    testWidgets('renders empty state', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      addTearDown(() => _dispose(container, database));

      await container.read(watchTissuesProvider.future);

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: TissueScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Nenhuma análise de tecido cadastrada'), findsOneWidget);
    });

    testWidgets('renders list with analyses', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      addTearDown(() => _dispose(container, database));

      final form = container.read(tissueFormProvider.notifier);
      await form.create(db.TissueAnalysisCompanion.insert(
        name: 'Amostra Folha',
      ));
      await form.create(db.TissueAnalysisCompanion.insert(
        name: 'Amostra Caule',
      ));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: TissueScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Amostra Folha'), findsOneWidget);
      expect(find.text('Amostra Caule'), findsOneWidget);
    });

    testWidgets('FAB navigates to new screen', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      final router = _testRouter();
      addTearDown(() => _dispose(container, database));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Nova análise'));
      await tester.pumpAndSettle();

      expect(find.text('Nova Análise'), findsOneWidget);
    });

    testWidgets('tap navigates to editor', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      final router = _testRouter();
      addTearDown(() => _dispose(container, database));

      final form = container.read(tissueFormProvider.notifier);
      await form.create(db.TissueAnalysisCompanion.insert(
        name: 'Amostra Folha',
      ));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Amostra Folha'));
      await tester.pumpAndSettle();

      expect(find.text('Editar Análise'), findsOneWidget);
    });
  });
}
