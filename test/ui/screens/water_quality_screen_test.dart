import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/water_quality_provider.dart';
import 'package:hydrobuddy/ui/screens/water_quality_screen.dart';
import 'package:hydrobuddy/ui/screens/water_quality_editor_screen.dart';

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
    initialLocation: '/water-quality',
    routes: [
      GoRoute(
        path: '/water-quality',
        builder: (context, state) => const WaterQualityScreen(),
        routes: [
          GoRoute(
            path: 'edit/:id',
            builder: (context, state) => WaterQualityEditorScreen(
              waterQualityId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: 'new',
            builder: (context, state) => const WaterQualityEditorScreen(),
          ),
        ],
      ),
    ],
  );
}

void main() {
  group('WaterQualityScreen', () {
    testWidgets('renders empty state', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      addTearDown(() => _dispose(container, database));

      await container.read(watchWaterQualitiesProvider.future);

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const WaterQualityScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Nenhum perfil de água cadastrado'), findsOneWidget);
    });

    testWidgets('renders list with water profiles', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      addTearDown(() => _dispose(container, database));

      final form = container.read(waterQualityFormProvider.notifier);
      await form.create(const db.WaterQualityCompanion(
        name: Value('Água da torneira'),
        ph: Value(7.0),
        gh: Value(4.0),
        kh: Value(3.0),
      ));
      await form.create(const db.WaterQualityCompanion(
        name: Value('Água RO'),
        ph: Value(6.5),
        gh: Value(0.0),
        kh: Value(0.0),
        is_default: Value(true),
      ));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const WaterQualityScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Água da torneira'), findsOneWidget);
      expect(find.text('Água RO'), findsOneWidget);
      expect(find.text('Padrão'), findsOneWidget);
    });

    testWidgets('FAB navigates to new screen', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      final router = _testRouter();
      addTearDown(() => _dispose(container, database));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('pt'),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Novo Perfil'));
      await tester.pumpAndSettle();

      expect(find.text('Novo Perfil'), findsOneWidget);
    });

    testWidgets('delete removes from list', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      addTearDown(() => _dispose(container, database));

      final form = container.read(waterQualityFormProvider.notifier);
      await form.create(const db.WaterQualityCompanion(
        name: Value('Para excluir'),
      ));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const WaterQualityScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Para excluir'), findsOneWidget);

      await tester.fling(find.text('Para excluir'), const Offset(-300, 0), 1000);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Excluir'));
      await tester.pumpAndSettle();

      expect(find.text('Para excluir'), findsNothing);
    });

    testWidgets('search filters profiles', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      addTearDown(() => _dispose(container, database));

      final form = container.read(waterQualityFormProvider.notifier);
      await form.create(const db.WaterQualityCompanion(name: Value('Água da torneira')));
      await form.create(const db.WaterQualityCompanion(name: Value('Água RO')));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const WaterQualityScreen()),
      ));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'torneira');
      await tester.pumpAndSettle();

      expect(find.text('Água da torneira'), findsOneWidget);
      expect(find.text('Água RO'), findsNothing);
    });

    testWidgets('tap card navigates to editor', (tester) async {
      final database = _testDb();
      final container = _makeContainer(database);
      final router = _testRouter();
      addTearDown(() => _dispose(container, database));

      final form = container.read(waterQualityFormProvider.notifier);
      await form.create(const db.WaterQualityCompanion(
        name: Value('Água da torneira'),
      ));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('pt'),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Água da torneira'));
      await tester.pumpAndSettle();

      expect(find.text('Editar Perfil'), findsOneWidget);
    });
  });
}
