import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:hydrobuddy/data/database.dart' as drift;
import 'package:hydrobuddy/data/substances_dao.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';
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
    testWidgets('1 — Renderiza sem crash com container ProviderScope',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('HydroBuddy'), findsOneWidget);
    });

    testWidgets('2 — Exibe grid de nutrientes quando alvos sao definidos',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      container.read(targetNutrientsProvider.notifier).set({
        Element.nNo3: 200,
        Element.k: 250,
        Element.ca: 180,
      });

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('N-NO3'), findsAtLeastNWidgets(1));
      expect(find.text('K'), findsAtLeastNWidgets(1));
      expect(find.text('Ca'), findsAtLeastNWidgets(1));
      expect(find.text('Nutrientes Alvo'), findsOneWidget);
    });

    testWidgets('3 — Exibe resultados quando calculationResult tem dados',
        (WidgetTester tester) async {
      final db = drift.AppDatabase.forTesting(NativeDatabase.memory());
      final container = _createContainer(db: db);
      addTearDown(() async {
        container.dispose();
        await db.close();
      });

      final dao = SubstancesDao(db);
      final id1 = await dao.insert(drift.SubstancesCompanion.insert(
        name: 'KNO3',
        n_no3: const Value(13.9),
        k: const Value(38.6),
        cost: const Value(5.0),
      ));

      container.read(targetNutrientsProvider.notifier).set({
        Element.nNo3: 200,
        Element.k: 250,
      });
      container.read(selectedSubstanceIdsProvider.notifier).set([id1]);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      expect(find.text('Elements — StringGrid1'), findsOneWidget);
      expect(find.text('EC / Custo'), findsOneWidget);
      expect(find.textContaining('EC'), findsAtLeastNWidgets(1));
    });

    testWidgets('4 — Exibe estado vazio quando targets estao vazios',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(
            'Preencha os nutrientes alvo e selecione substâncias'),
        findsOneWidget,
      );
    });

    testWidgets('5 — Exibe mensagem de erro quando result.error nao eh null',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      container.read(targetNutrientsProvider.notifier).set({
        Element.nNo3: 200,
      });
      container.read(selectedSubstanceIdsProvider.notifier).set([999]);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      expect(
        find.text(
            'Nenhuma substância encontrada para os IDs fornecidos'),
        findsOneWidget,
      );
    });

    testWidgets('6 — Exibe secao Volume e botoes de unidade',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Volume'), findsAtLeastNWidgets(1));
      expect(find.text('L'), findsOneWidget);
      expect(find.text('gal'), findsOneWidget);
    });

    testWidgets('7 — Exibe secoes de radio (Calc Mode, Solution Mode, EC Model)',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Calc Mode'), findsOneWidget);
      expect(find.text('Solution Mode'), findsOneWidget);
      expect(find.text('EC Model'), findsOneWidget);
      expect(find.text('Input Desired Concentrations'), findsOneWidget);
      expect(find.text('Direct addition'), findsOneWidget);
    });

    testWidgets('8 — Exibe secao de substancias com botao Select',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Substances'), findsOneWidget);
      expect(find.text('Select Substances'), findsOneWidget);
      expect(find.text('No substances selected'), findsOneWidget);
    });

    testWidgets('9 — Exibe secao DOF com dropdown',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Free element (DOF)'), findsOneWidget);
    });

    testWidgets('10 — Exibe secao Instrument Precision',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Instrument Precision'), findsOneWidget);
    });

    testWidgets('11 — Exibe botao Carry Out Calculation',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Carry Out Calculation'), findsOneWidget);
    });

    testWidgets('12 — Exibe Si source section',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: CalculatorScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Si source'), findsOneWidget);
      expect(find.text('Si'), findsAtLeastNWidgets(1));
      expect(find.text('SiO\u2082'), findsOneWidget);
    });
  });
}
