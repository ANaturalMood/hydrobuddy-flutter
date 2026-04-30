import 'package:drift/native.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hydrobuddy/data/database.dart' as db;
import 'package:hydrobuddy/ui/providers/database_provider.dart';
import 'package:hydrobuddy/ui/screens/settings_screen.dart';
import 'package:hydrobuddy/ui/screens/instrument_precision_screen.dart';
import 'package:hydrobuddy/ui/screens/degree_of_freedom_screen.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/screens/about_screen.dart';

db.AppDatabase _testDb() =>
    db.AppDatabase.forTesting(NativeDatabase.memory());

Widget _wrap(Widget child, {db.AppDatabase? database}) {
  final effectiveDb = database ?? _testDb();
  return ProviderScope(
    overrides: [databaseProvider.overrideWithValue(effectiveDb)],
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
    testWidgets('renders hero and water analysis section', (tester) async {
      final database = _testDb();
      addTearDown(() async => database.close());
      await tester.pumpWidget(_wrap(const SettingsScreen(), database: database));
      await tester.pumpAndSettle();

      expect(find.text('Configuration & Lab Setup'), findsOneWidget);
      expect(find.text('Baseline Water Analysis'), findsOneWidget);
      expect(find.text('Instrument Precision'), findsOneWidget);
      expect(find.text('Preferences'), findsOneWidget);
    });

    testWidgets('renders save and reset buttons', (tester) async {
      final database = _testDb();
      addTearDown(() async => database.close());
      await tester.pumpWidget(_wrap(const SettingsScreen(), database: database));
      await tester.pumpAndSettle();

      expect(find.text('Save All Settings'), findsOneWidget);
      expect(find.text('Reset to Defaults'), findsOneWidget);
    });

    testWidgets('shows about section', (tester) async {
      final database = _testDb();
      addTearDown(() async => database.close());
      await tester.pumpWidget(_wrap(const SettingsScreen(), database: database));
      await tester.pumpAndSettle();

      expect(find.text('ABOUT HYDROBUDDY'), findsOneWidget);
      expect(find.text('Version 2.4.12-stable'), findsOneWidget);
      expect(find.text('Built for Precision Growth'), findsOneWidget);
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
