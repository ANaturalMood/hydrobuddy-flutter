import 'package:flutter/material.dart' hide Element;
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:hydrobuddy/data/database.dart' as drift;
import 'package:hydrobuddy/data/substances_dao.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/screens/calculator_screen.dart';

ProviderContainer _createContainer({drift.AppDatabase? db}) {
  final effectiveDb =
      db ?? drift.AppDatabase.forTesting(NativeDatabase.memory());
  return ProviderContainer(
    overrides: [
      databaseProvider.overrideWithValue(effectiveDb),
    ],
  );
}

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('CalculatorScreen widget tests', () {
    testWidgets('1 — Renderiza sem crash com header HydroBuddy',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('HydroBuddy'), findsOneWidget);
    });

    testWidgets('2 — Exibe toggle de modo (Input Desired / From Weights)',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Input Desired'), findsOneWidget);
      expect(find.text('From Weights'), findsOneWidget);
    });

    testWidgets('3 — Exibe seção System Parameters com campos de volume e tipo',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('System Parameters'), findsOneWidget);
      expect(find.text('VOLUME (L)'), findsOneWidget);
      expect(find.text('Direct'), findsOneWidget);
      expect(find.text('A+B'), findsOneWidget);
      expect(find.text('CONCENTRATION FACTOR'), findsOneWidget);
    });

    testWidgets('4 — Exibe grid de nutrientes com 16 elementos',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Target Concentrations (ppm)'), findsOneWidget);
      expect(find.text('N-NO3'), findsAtLeastNWidgets(1));
      expect(find.text('Mg'), findsAtLeastNWidgets(1));
      expect(find.text('Fe'), findsAtLeastNWidgets(1));
    });

    testWidgets('5 — Exibe seção Salt Selection com Select All',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Salt Selection'), findsOneWidget);
      expect(find.text('Select All'), findsOneWidget);
      expect(find.text('Add Custom Salt'), findsOneWidget);
    });

    testWidgets('6 — Exibe botão flutuante Calculate',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Calculate'), findsOneWidget);
    });

    testWidgets('7 — Exibe formulário de loader de formulation',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('LOAD EXISTING FORMULATION'), findsOneWidget);
      expect(find.text('Select a recipe...'), findsOneWidget);
    });

    testWidgets('8 — Mode toggle muda estado do provider',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(container.read(calculationModeProvider),
          calc.CalcMode.directAddition);

      await tester.tap(find.text('From Weights'));
      await tester.pumpAndSettle();

      expect(container.read(calculationModeProvider),
          calc.CalcMode.prepareStock);
    });

    testWidgets('9 — Exibe tabela de sais com substâncias do banco',
        (WidgetTester tester) async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      final dao = SubstancesDao(db);
      await dao.insert(drift.SubstancesCompanion.insert(
        name: 'Potassium Nitrate',
        formula: const Value('KNO3'),
        purity: const Value(0.98),
      ));

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Potassium Nitrate'), findsOneWidget);
      expect(find.text('KNO3'), findsOneWidget);
      expect(find.text('98%'), findsOneWidget);
    });

    testWidgets('10 — Accordion de Salt Selection vem aberto por padrão',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: const CalculatorScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Salt Selection'), findsOneWidget);
      expect(find.text('Select All'), findsOneWidget);
      expect(find.text('Add Custom Salt'), findsOneWidget);
    });
  });
}
