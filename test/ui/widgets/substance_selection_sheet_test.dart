import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:hydrobuddy/data/database.dart' as drift;
import 'package:hydrobuddy/data/substances_dao.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/widgets/substance_selection_sheet.dart';

ProviderContainer _createContainer({drift.AppDatabase? db}) {
  final effectiveDb =
      db ?? drift.AppDatabase.forTesting(NativeDatabase.memory());
  return ProviderContainer(
    overrides: [
      databaseProvider.overrideWithValue(effectiveDb),
    ],
  );
}

Future<int> _seedSubstance(drift.AppDatabase db,
    {required String name, String? formula}) async {
  final dao = SubstancesDao(db);
  return dao.insert(drift.SubstancesCompanion.insert(
    name: name,
    formula: Value(formula),
  ));
}

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('SubstanceSelectionSheet widget tests', () {
    testWidgets('1 — Renderiza com titulo e botoes',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Substance Selection'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('2 — Exibe listas Available e Used vazias',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Available (0)'), findsOneWidget);
      expect(find.text('Used (0)'), findsOneWidget);
      expect(find.text('Empty'), findsAtLeastNWidgets(1));
    });

    testWidgets('3 — Exibe substancias na lista Available',
        (WidgetTester tester) async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      await _seedSubstance(db, name: 'KNO3');
      await _seedSubstance(db, name: 'CaCl2');
      await _seedSubstance(db, name: 'MgSO4');

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Available (3)'), findsOneWidget);
      expect(find.text('KNO3'), findsAtLeastNWidgets(1));
      expect(find.text('CaCl2'), findsOneWidget);
      expect(find.text('MgSO4'), findsOneWidget);
    });

    testWidgets('4 — Move substancia de Available para Used',
        (WidgetTester tester) async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      await _seedSubstance(db, name: 'KNO3');

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Available (1)'), findsOneWidget);

      await tester.tap(find.text('KNO3').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add >>'));
      await tester.pumpAndSettle();

      expect(find.text('Available (0)'), findsOneWidget);
      expect(find.text('Used (1)'), findsOneWidget);
    });

    testWidgets('5 — Substancia pre-selecionada aparece em Used',
        (WidgetTester tester) async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      final id = await _seedSubstance(db, name: 'CaCl2');

      container.read(selectedSubstanceIdsProvider.notifier).set([id]);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Available (0)'), findsOneWidget);
      expect(find.text('Used (1)'), findsOneWidget);
    });

    testWidgets('6 — Remove substancia de Used para Available',
        (WidgetTester tester) async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      final id = await _seedSubstance(db, name: 'CaCl2');

      container.read(selectedSubstanceIdsProvider.notifier).set([id]);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Used (1)'), findsOneWidget);

      await tester.tap(find.text('CaCl2').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('<< Remove'));
      await tester.pumpAndSettle();

      expect(find.text('Available (1)'), findsOneWidget);
      expect(find.text('Used (0)'), findsOneWidget);
    });

    testWidgets('7 — Remove All limpa lista Used',
        (WidgetTester tester) async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      final id1 = await _seedSubstance(db, name: 'KNO3');
      final id2 = await _seedSubstance(db, name: 'MgSO4');

      container
          .read(selectedSubstanceIdsProvider.notifier)
          .set([id1, id2]);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Used (2)'), findsOneWidget);

      await tester.ensureVisible(find.text('Remove All'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Remove All'));
      await tester.pumpAndSettle();

      expect(find.text('Used (0)'), findsOneWidget);
      expect(find.text('Available (2)'), findsOneWidget);
    });

    testWidgets('8 — Todos os botoes de acao estao presentes',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: SubstanceSelectionSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add >>'), findsOneWidget);
      expect(find.text('<< Remove'), findsOneWidget);
      expect(find.text('Set Amount'), findsOneWidget);
      expect(find.text('Reset Amounts'), findsOneWidget);
      expect(find.text('Add New'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Delete f/DB'), findsOneWidget);
      expect(find.text('Save List'), findsOneWidget);
      expect(find.text('Load List'), findsOneWidget);
      expect(find.text('Remove All'), findsOneWidget);
    });
  });
}
