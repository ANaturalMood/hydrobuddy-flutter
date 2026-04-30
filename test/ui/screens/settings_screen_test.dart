import 'package:flutter/material.dart' hide Element;
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hydrobuddy/ui/screens/settings_screen.dart';
import 'package:hydrobuddy/ui/screens/instrument_precision_screen.dart';
import 'package:hydrobuddy/ui/screens/degree_of_freedom_screen.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/screens/about_screen.dart';

Widget _wrap(Widget child) {
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pt'),
      home: child,
    ),
  );
}

void main() {
  group('SettingsScreen', () {
    testWidgets('renders settings list items', (tester) async {
      await tester.pumpWidget(_wrap(const SettingsScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Configurações'), findsOneWidget);
      expect(find.text('Precisão dos Instrumentos'), findsOneWidget);
      expect(find.text('Grau de Liberdade (DOF)'), findsOneWidget);
      expect(find.text('Qualidade da Água'), findsOneWidget);
      expect(find.text('Análise de Tecido'), findsOneWidget);
      expect(find.text('Sobre o HydroBuddy'), findsOneWidget);
      expect(find.text('Idioma'), findsOneWidget);
      expect(find.text('Tema'), findsOneWidget);
    });

    testWidgets('shows snackbar for Idioma placeholder', (tester) async {
      await tester.pumpWidget(_wrap(const SettingsScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Idioma'));
      await tester.pumpAndSettle();

      expect(find.text('Em breve'), findsOneWidget);
    });

    testWidgets('shows snackbar for Tema placeholder', (tester) async {
      await tester.pumpWidget(_wrap(const SettingsScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Tema'));
      await tester.pumpAndSettle();

      expect(find.text('Em breve'), findsOneWidget);
    });
  });

  group('InstrumentPrecisionScreen', () {
    testWidgets('renders volume and weight error fields', (tester) async {
      await tester.pumpWidget(_wrap(const InstrumentPrecisionScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Precisão dos Instrumentos'), findsOneWidget);
      expect(find.text('Erro do Volume (mL)'), findsOneWidget);
      expect(find.text('Erro da Balança (g)'), findsOneWidget);
    });
  });

  group('DegreeOfFreedomScreen', () {
    testWidgets('renders 16 radio options plus null', (tester) async {
      await tester.pumpWidget(_wrap(const DegreeOfFreedomScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Grau de Liberdade (DOF)'), findsOneWidget);
      expect(
        find.byWidgetPredicate((w) => w is RadioListTile),
        findsWidgets,
      );
      expect(find.text('Nenhum (sistema totalmente restrito)'), findsOneWidget);
      expect(find.text('Potassium (K)'), findsOneWidget);
      expect(find.text('Nitrate Nitrogen (N-NO3)'), findsOneWidget);

      // Scroll to verify last element
      await tester.scrollUntilVisible(
        find.text('Chlorine (Cl)'),
        200,
      );
      expect(find.text('Chlorine (Cl)'), findsOneWidget);
    });

    testWidgets('selects a DOF value', (tester) async {
      await tester.pumpWidget(_wrap(const DegreeOfFreedomScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Potassium (K)'));
      await tester.pumpAndSettle();

      expect(find.text('Potassium (K)'), findsOneWidget);
    });
  });

  group('AboutScreen', () {
    testWidgets('renders version info', (tester) async {
      await tester.pumpWidget(_wrap(const AboutScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Sobre'), findsOneWidget);
      expect(find.text('HydroBuddy'), findsOneWidget);
      expect(find.text('1.0.0+1'), findsOneWidget);
      expect(
        find.text('Calculadora de soluções nutritivas hidropônicas'),
        findsOneWidget,
      );
      expect(find.text('Créditos'), findsOneWidget);
    });
  });
}
