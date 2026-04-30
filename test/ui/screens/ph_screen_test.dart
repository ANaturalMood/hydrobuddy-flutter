import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';

import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/screens/ph_screen.dart';

Widget _wrap() {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: const Locale('pt'),
    home: const PhScreen(),
  );
}

void main() {
  group('PhScreen', () {
    testWidgets('renders pH screen', (tester) async {
      await tester.pumpWidget(_wrap());
      await tester.pumpAndSettle();

      expect(find.text('Ajuste de pH'), findsOneWidget);
      expect(find.text('pH atual'), findsOneWidget);
      expect(find.text('pH alvo'), findsOneWidget);
      expect(find.text('Volume'), findsOneWidget);
      expect(find.text('Ácido'), findsOneWidget);
      expect(find.text('Calcular'), findsOneWidget);
    });

    testWidgets('calculates acid amount', (tester) async {
      await tester.pumpWidget(_wrap());
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextField, 'pH atual'), '7.0');
      await tester.enterText(find.widgetWithText(TextField, 'pH alvo'), '5.5');
      await tester.enterText(find.widgetWithText(TextField, 'Volume'), '10');

      await tester.tap(find.text('Calcular'));
      await tester.pumpAndSettle();

      // 10 L * (7.0 - 5.5) * 0.5 = 7.50 mL (phosphoric is default)
      expect(find.textContaining('7.50 mL'), findsOneWidget);
    });

    testWidgets('calculates with different acid', (tester) async {
      await tester.pumpWidget(_wrap());
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextField, 'pH atual'), '8.0');
      await tester.enterText(find.widgetWithText(TextField, 'pH alvo'), '5.0');
      await tester.enterText(find.widgetWithText(TextField, 'Volume'), '20');

      // Change acid to sulfuric
      await tester.tap(find.text('Ácido Fosfórico (H₃PO₄)'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Ácido Sulfúrico (H₂SO₄)').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Calcular'));
      await tester.pumpAndSettle();

      // 20 L * (8.0 - 5.0) * 0.2 = 12.00 mL
      expect(find.textContaining('12.00 mL'), findsOneWidget);
    });

    testWidgets('shows error snackbar for empty fields', (tester) async {
      await tester.pumpWidget(_wrap());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Calcular'));
      await tester.pumpAndSettle();

      expect(find.text('Preencha todos os campos com valores válidos'), findsOneWidget);
    });

    testWidgets('shows error when current pH is not greater than target pH', (tester) async {
      await tester.pumpWidget(_wrap());
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextField, 'pH atual'), '5.0');
      await tester.enterText(find.widgetWithText(TextField, 'pH alvo'), '6.0');
      await tester.enterText(find.widgetWithText(TextField, 'Volume'), '10');

      await tester.tap(find.text('Calcular'));
      await tester.pumpAndSettle();

      expect(find.text('pH atual deve ser maior que o pH alvo'), findsOneWidget);
    });
  });
}
