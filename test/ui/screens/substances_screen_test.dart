import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/data/database.dart' hide Substance;
import 'package:hydrobuddy/domain/models/substance.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/screens/substances_screen.dart';
import 'package:hydrobuddy/ui/screens/substance_editor_screen.dart';

AppDatabase _testDb() => AppDatabase.forTesting(NativeDatabase.memory());

ProviderContainer _makeContainer(AppDatabase db) {
  return ProviderContainer(
    overrides: [databaseProvider.overrideWithValue(db)],
  );
}

Future<void> _dispose(ProviderContainer container, AppDatabase db) async {
  container.dispose();
  await db.close();
}

GoRouter _testRouter() {
  return GoRouter(
    initialLocation: '/substances',
    routes: [
      GoRoute(
        path: '/substances',
        builder: (context, state) => const SubstancesScreen(),
        routes: [
          GoRoute(
            path: 'edit/:id',
            builder: (context, state) => SubstanceEditorScreen(
              substanceId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: 'new',
            builder: (context, state) => const SubstanceEditorScreen(),
          ),
        ],
      ),
    ],
  );
}

void main() {
  group('SubstancesScreen', () {
    testWidgets('renderiza lista vazia com mensagem', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      addTearDown(() => _dispose(container, db));

      await container.read(watchSubstancesProvider.future);

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const SubstancesScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Nenhuma substancia cadastrada'), findsOneWidget);
    });

    testWidgets('renderiza com dados de substancias', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      addTearDown(() => _dispose(container, db));

      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'Potassium Nitrate', formula: 'KNO3', k: 38.6, nNo3: 13.9));
      await form.create(Substance(id: 0, name: 'Calcium Nitrate', formula: 'Ca(NO3)2', ca: 24.4, nNo3: 17.1));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const SubstancesScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Potassium Nitrate'), findsOneWidget);
      expect(find.text('Calcium Nitrate'), findsOneWidget);
    });

    testWidgets('search filtra substancias', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      addTearDown(() => _dispose(container, db));

      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'Potassium Nitrate', formula: 'KNO3', k: 38.6));
      await form.create(Substance(id: 0, name: 'Calcium Nitrate', formula: 'Ca(NO3)2', ca: 24.4));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const SubstancesScreen()),
      ));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Calcium');
      await tester.pumpAndSettle();

      expect(find.text('Calcium Nitrate'), findsOneWidget);
      expect(find.text('Potassium Nitrate'), findsNothing);
    });

    testWidgets('renderiza FAB de adicionar', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      addTearDown(() => _dispose(container, db));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const SubstancesScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Adicionar substancia'), findsOneWidget);
    });

    testWidgets('tap no FAB navega para tela de nova substancia', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      final router = _testRouter();
      addTearDown(() => _dispose(container, db));

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

      await tester.tap(find.text('Adicionar substancia'));
      await tester.pumpAndSettle();

      expect(find.text('Nova Substancia'), findsOneWidget);
    });

    testWidgets('tap no card navega para tela de edicao', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      final router = _testRouter();
      addTearDown(() => _dispose(container, db));

      final form = container.read(substanceFormProvider.notifier);
      await form.create(Substance(id: 0, name: 'Potassium Nitrate', formula: 'KNO3', k: 38.6));

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

      await tester.tap(find.text('Potassium Nitrate'));
      await tester.pumpAndSettle();

      expect(find.text('Editar Substancia'), findsOneWidget);
    });
  });

  group('SubstanceEditorScreen', () {
    testWidgets('renderiza formulario vazio para nova substancia', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      addTearDown(() => _dispose(container, db));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const SubstanceEditorScreen()),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Nova Substancia'), findsOneWidget);
      expect(find.byType(TextFormField), findsWidgets);

      await tester.scrollUntilVisible(
        find.text('Salvar'), 200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      expect(find.text('Salvar'), findsOneWidget);
    });

    testWidgets('valida nome obrigatorio ao salvar vazio', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      addTearDown(() => _dispose(container, db));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const SubstanceEditorScreen()),
      ));
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('Salvar'), 200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Salvar'), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.text('Nome obrigatorio'), findsOneWidget);
    });

    testWidgets('valida pureza fora do range 0-1', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      addTearDown(() => _dispose(container, db));

      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: const Locale('pt'),
                        home: const SubstanceEditorScreen()),
      ));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'Teste');
      await tester.enterText(find.byType(TextFormField).at(3), '1.5');
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('Salvar'), 200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Salvar'), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.text('Valor entre 0.0 e 1.0'), findsOneWidget);
    });

    testWidgets('salva nova substancia e navega de volta', (tester) async {
      final db = _testDb();
      final container = _makeContainer(db);
      final router = _testRouter();
      addTearDown(() => _dispose(container, db));

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

      await tester.tap(find.text('Adicionar substancia'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'Nova Subst');
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('Salvar'), 200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Salvar'), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.text('Nova Subst'), findsOneWidget);
    });
  });
}
