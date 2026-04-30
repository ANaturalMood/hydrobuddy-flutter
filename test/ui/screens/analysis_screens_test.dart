import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/models/element.dart' as domain;
import 'package:hydrobuddy/l10n/app_localizations.dart';
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/screens/mix_analysis_screen.dart';
import 'package:hydrobuddy/ui/screens/per_substance_screen.dart';
import 'package:hydrobuddy/ui/screens/ratio_screen.dart';
import 'package:hydrobuddy/ui/screens/stock_analysis_screen.dart';

final _emptyResult = CalculationResult(
  substances: [],
  achievedConcentrations: {},
  targetConcentrations: {},
  totalCost: 0,
  predictedEc: 0,
);

Widget _wrap(Widget child) {
  return ProviderScope(
    child: MaterialApp(
      locale: const Locale('pt'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    ),
  );
}

void main() {
  group('StockAnalysisScreen', () {
    testWidgets('renders placeholder when no result', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(_emptyResult)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const StockAnalysisScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Execute o cálculo primeiro'), findsOneWidget);
    });
  });

  group('PerSubstanceScreen', () {
    testWidgets('renders placeholder when no data', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(_emptyResult)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: PerSubstanceScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Execute o cálculo primeiro'), findsOneWidget);
    });
  });

  group('RatioScreen', () {
    testWidgets('renders NPK ratio section', (tester) async {
      final result = CalculationResult(
        substances: [
          const SubstanceResult(substanceId: 1, weight: 5, cost: 0.1),
        ],
        achievedConcentrations: {
          domain.Element.nNo3: 150.0,
          domain.Element.p: 40.0,
          domain.Element.k: 180.0,
          domain.Element.ca: 120.0,
          domain.Element.mg: 50.0,
          domain.Element.s: 30.0,
        },
        targetConcentrations: {
          domain.Element.nNo3: 150.0,
          domain.Element.p: 40.0,
          domain.Element.k: 180.0,
        },
        totalCost: 0.1,
        predictedEc: 1.5,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(result)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const RatioScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('NPK'), findsOneWidget);
      expect(find.text('Ca : Mg'), findsAtLeast(1));
      expect(find.text('K : Ca : Mg'), findsAtLeast(1));
      expect(find.text('N : S'), findsAtLeast(1));
      expect(find.text('Ca : (Mg+K)'), findsAtLeast(1));
    });
  });

  group('MixAnalysisScreen', () {
    testWidgets('renders NPK label calculation', (tester) async {
      final result = CalculationResult(
        substances: [
          const SubstanceResult(substanceId: 1, weight: 2.5, cost: 0.05),
          const SubstanceResult(substanceId: 2, weight: 3.0, cost: 0.08),
        ],
        achievedConcentrations: {
          domain.Element.nNo3: 150.0,
          domain.Element.p: 40.0,
          domain.Element.k: 180.0,
          domain.Element.ca: 120.0,
          domain.Element.mg: 50.0,
        },
        targetConcentrations: {
          domain.Element.nNo3: 150.0,
          domain.Element.p: 40.0,
          domain.Element.k: 180.0,
        },
        totalCost: 0.13,
        predictedEc: 1.8,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(result)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const MixAnalysisScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Rótulo NPK'), findsOneWidget);
      expect(find.text('N-P₂O₅-K₂O'), findsOneWidget);
      expect(find.text('NPK Detalhado'), findsOneWidget);
      expect(find.textContaining('Peso seco total'), findsOneWidget);
    });
  });

  group('All analysis screens', () {
    testWidgets('stock shows stock analysis title', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(_emptyResult)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const StockAnalysisScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Análise de Estoque (A+B)'), findsOneWidget);
    });

    testWidgets('per substance shows title', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(_emptyResult)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const PerSubstanceScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Análise por Substância'), findsOneWidget);
    });

    testWidgets('ratio screen shows title', (tester) async {
      final result = CalculationResult(
        substances: [
          const SubstanceResult(substanceId: 1, weight: 5, cost: 0.1),
        ],
        achievedConcentrations: {
          domain.Element.nNo3: 150.0,
          domain.Element.p: 40.0,
          domain.Element.k: 180.0,
        },
        targetConcentrations: {},
        totalCost: 0.1,
        predictedEc: 1.5,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(result)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const RatioScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Ratios Nutricionais'), findsOneWidget);
    });

    testWidgets('mix shows title', (tester) async {
      final result = CalculationResult(
        substances: [
          const SubstanceResult(substanceId: 1, weight: 5, cost: 0.1),
        ],
        achievedConcentrations: {
          domain.Element.nNo3: 150.0,
          domain.Element.p: 40.0,
          domain.Element.k: 180.0,
        },
        targetConcentrations: {},
        totalCost: 0.1,
        predictedEc: 1.5,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            calculationResultProvider.overrideWith((ref) => Future.value(result)),
          ],
          child: MaterialApp(
                  locale: const Locale('pt'),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const MixAnalysisScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Composição do Mix'), findsOneWidget);
    });
  });
}
