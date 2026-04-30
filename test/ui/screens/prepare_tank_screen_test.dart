import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hydrobuddy/domain/models/formulation.dart';
import 'package:hydrobuddy/ui/providers/formulations_provider.dart';
import 'package:hydrobuddy/ui/providers/tank_provider.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/screens/prepare_tank_screen.dart';

final _testFormulation = Formulation(
  id: 1,
  name: 'Tomate Vegetativo v3',
  createdAt: DateTime(2025),
  updatedAt: DateTime(2025),
  volumeUnit: 'L',
  concUnit: 'ppm',
);

Widget _wrap(List<Override> overrides) {
  final container = ProviderContainer(overrides: overrides);
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pt'),
      home: const PrepareTankScreen(),
    ),
  );
}

void main() {
  group('PrepareTankScreen', () {
    testWidgets('renders form fields', (tester) async {
      await tester.pumpWidget(_wrap([
        watchFormulationsProvider.overrideWith((ref) async => [_testFormulation]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('Preparar Tanque'), findsOneWidget);
      expect(find.text('Nome'), findsOneWidget);
      expect(find.text('Formulações'), findsOneWidget);
      expect(find.text('Volume'), findsOneWidget);
      expect(find.text('Resumo da Receita'), findsOneWidget);
    });

    testWidgets('shows recipe summary placeholder', (tester) async {
      await tester.pumpWidget(_wrap([
        watchFormulationsProvider.overrideWith((ref) async => [_testFormulation]),
      ]));
      await tester.pumpAndSettle();

      expect(
          find.text('KNO3: --g    MgSO4: --g    Ca(NO3)2: --g'),
          findsOneWidget);
      expect(find.text('KH2PO4: --g    Micros: --g'), findsOneWidget);
      expect(find.text('EC previsto: -- mS/cm    Custo: --/L'), findsOneWidget);
    });

    testWidgets('shows Medições section', (tester) async {
      await tester.pumpWidget(_wrap([
        watchFormulationsProvider.overrideWith((ref) async => [_testFormulation]),
      ]));
      await tester.pumpAndSettle();

      final scrollable = find.byType(Scrollable).first;
      await tester.scrollUntilVisible(find.text('Medições (opcional)'), 200,
          scrollable: scrollable);
      await tester.pumpAndSettle();

      expect(find.text('EC real'), findsOneWidget);
      expect(find.text('pH real'), findsOneWidget);
    });

    testWidgets('volume input is present with L suffix', (tester) async {
      await tester.pumpWidget(_wrap([
        watchFormulationsProvider.overrideWith((ref) async => [_testFormulation]),
      ]));
      await tester.pumpAndSettle();

      expect(find.text('Volume'), findsOneWidget);
      final suffix = find.text('L');
      expect(suffix, findsAtLeast(1));
    });

    testWidgets('has Registar Preparo button', (tester) async {
      await tester.pumpWidget(_wrap([
        watchFormulationsProvider.overrideWith((ref) async => [_testFormulation]),
      ]));
      await tester.pumpAndSettle();

      final scrollable = find.byType(Scrollable).first;
      await tester.scrollUntilVisible(find.text('Registrar Preparo'), 200,
          scrollable: scrollable);
      await tester.pumpAndSettle();

      expect(find.text('Registrar Preparo'), findsOneWidget);
    });
  });
}
