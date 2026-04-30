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
  final effectiveDb = db ?? drift.AppDatabase.forTesting(NativeDatabase.memory());
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

    testWidgets('2 — Exibe grid de nutrientes quando alvos são definidos',
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

      // Verifica que labels dos nutrientes estão visíveis
      expect(find.text('N-NO3'), findsOneWidget);
      expect(find.text('K'), findsOneWidget);
      expect(find.text('Ca'), findsOneWidget);
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

      // Aguarda o debounce do provider computado (300ms + margem)
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      // Verifica seção de resultados
      expect(find.text('Elementos'), findsOneWidget);
      expect(find.text('Métricas'), findsOneWidget);
      expect(find.text('EC previsto'), findsOneWidget);
    });

    testWidgets('4 — Exibe estado vazio quando targets estão vazios',
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
        find.text('Preencha os nutrientes alvo e selecione substâncias'),
        findsOneWidget,
      );
    });

    testWidgets('5 — Exibe mensagem de erro quando result.error não é null',
        (WidgetTester tester) async {
      final container = _createContainer();
      addTearDown(container.dispose);

      // Define targets e IDs inválidos para gerar erro
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

      // Aguarda o debounce
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      // Deve exibir erro (substância não encontrada)
      expect(
        find.text('Nenhuma substância encontrada para os IDs fornecidos'),
        findsOneWidget,
      );
    });
  });
}
