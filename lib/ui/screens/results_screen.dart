import 'package:flutter/material.dart' hide Element;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrobuddy/domain/models/calculation_result.dart';
import 'package:hydrobuddy/domain/models/element.dart';
import 'package:hydrobuddy/domain/models/calculation_input.dart' as calc;
import 'package:hydrobuddy/ui/providers/calculator_provider.dart';
import 'package:hydrobuddy/ui/providers/substances_provider.dart';

class ResultsScreen extends ConsumerStatefulWidget {
  const ResultsScreen({super.key});

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final resultAsync = ref.watch(calculationResultProvider);
    final substancesAsync = ref.watch(watchSubstancesProvider);
    final calcMode = ref.watch(calculationModeProvider);
    final dilutionFactor = ref.watch(dilutionFactorProvider);

    return Scaffold(
      body: Stack(
        children: [
          resultAsync.when(
            data: (result) {
              final nameMap = substancesAsync.maybeWhen(
                data: (subs) => {for (final s in subs) s.id: s.name},
                orElse: () => <int, String>{},
              );
              return _buildBody(
                context, theme, cs, result, nameMap, calcMode, dilutionFactor,
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Error loading results: $e',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: cs.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          _buildHeader(context, theme, cs),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme, ColorScheme cs) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: cs.surface,
          border: Border(
            bottom: BorderSide(color: cs.outlineVariant),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.science, color: cs.primary),
            const SizedBox(width: 8),
            Text(
              'HydroBuddy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: cs.primary,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.share, color: cs.onSurfaceVariant),
              onPressed: () {},
              tooltip: 'Share',
            ),
            IconButton(
              icon: Icon(Icons.print, color: cs.onSurfaceVariant),
              onPressed: () {},
              tooltip: 'Print',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
    Map<int, String> nameMap,
    calc.CalcMode calcMode,
    double dilutionFactor,
  ) {
    final bool hasData = result.substances.isNotEmpty ||
        result.achievedConcentrations.isNotEmpty;

    if (!hasData && result.targetConcentrations.isEmpty) {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'No calculation results yet',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: cs.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 768;

        return SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 80,
            bottom: 32,
            left: 16,
            right: 16,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1280),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleSection(context, theme, cs, result),
                const SizedBox(height: 24),
                _buildSummaryGrid(
                  context, theme, cs, result, isWide, dilutionFactor,
                ),
                if (result.warnings.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _buildErrorAlert(context, theme, cs, result),
                ],
                const SizedBox(height: 20),
                _buildTablesSection(
                  context, theme, cs, result, nameMap, isWide,
                ),
                if (calcMode == calc.CalcMode.prepareStock) ...[
                  const SizedBox(height: 24),
                  _buildMixingInstructions(
                    context, theme, cs, isWide,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CALCULATION REPORT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: cs.primary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Calculation Results',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: cs.onSurface,
            letterSpacing: -0.02,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryGrid(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
    bool isWide,
    double dilutionFactor,
  ) {
    if (isWide) {
      return Row(
        children: [
          Expanded(child: _ecCard(context, theme, cs, result)),
          const SizedBox(width: 20),
          Expanded(child: _costCard(context, theme, cs, result)),
          const SizedBox(width: 20),
          Expanded(child: _ratioCard(context, theme, cs, dilutionFactor)),
        ],
      );
    }
    return Column(
      children: [
        _ecCard(context, theme, cs, result),
        const SizedBox(height: 20),
        _costCard(context, theme, cs, result),
        const SizedBox(height: 20),
        _ratioCard(context, theme, cs, dilutionFactor),
      ],
    );
  }

  Widget _ecCard(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Predicted EC',
                style: TextStyle(
                  fontSize: 14,
                  color: cs.onSurfaceVariant,
                ),
              ),
              Icon(Icons.bolt, color: cs.primary, size: 24),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '${result.predictedEc.toStringAsFixed(1)} mS/cm',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Optimal range for growth stage',
            style: TextStyle(
              fontSize: 14,
              color: cs.outline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _costCard(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Batch Cost',
                style: TextStyle(
                  fontSize: 14,
                  color: cs.onSurfaceVariant,
                ),
              ),
              Icon(Icons.payments, color: cs.secondary, size: 24),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '\$${result.totalCost.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Calculated for batch',
            style: TextStyle(
              fontSize: 14,
              color: cs.outline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ratioCard(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    double dilutionFactor,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.secondaryContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.secondaryContainer.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mix Ratio',
                style: TextStyle(
                  fontSize: 14,
                  color: cs.onSecondaryContainer,
                ),
              ),
              Icon(Icons.water_drop, color: cs.secondary, size: 24),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '1:${dilutionFactor.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: cs.onSecondaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Concentrate A+B Solution',
            style: TextStyle(
              fontSize: 14,
              color: cs.onSecondaryContainer.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorAlert(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
  ) {
    final warning = result.warnings.isNotEmpty
        ? result.warnings.first
        : 'Precision alert';
    String elementLabel = '';
    if (warning.contains('Zn')) elementLabel = 'Zinc (Zn)';
    else if (warning.contains('Fe')) elementLabel = 'Iron (Fe)';
    else if (warning.contains('Mn')) elementLabel = 'Manganese (Mn)';
    else if (warning.contains('Cu')) elementLabel = 'Copper (Cu)';
    else if (warning.contains('B')) elementLabel = 'Boron (B)';
    else if (warning.contains('Mo')) elementLabel = 'Molybdenum (Mo)';
    else elementLabel = warning;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.errorContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.error.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning, color: cs.error, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Precision Alert: $elementLabel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: cs.onErrorContainer,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  warning,
                  style: TextStyle(
                    fontSize: 14,
                    color: cs.onErrorContainer.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTablesSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
    Map<int, String> nameMap,
    bool isWide,
  ) {
    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _saltMassesTable(context, theme, cs, result, nameMap),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: _concentrationTable(context, theme, cs, result),
          ),
        ],
      );
    }
    return Column(
      children: [
        _saltMassesTable(context, theme, cs, result, nameMap),
        const SizedBox(height: 20),
        _concentrationTable(context, theme, cs, result),
      ],
    );
  }

  Widget _saltMassesTable(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
    Map<int, String> nameMap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: cs.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Required Salt Masses',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: cs.onSecondary,
                  ),
                ),
                const Spacer(),
                Icon(Icons.balance, color: cs.onSecondary.withValues(alpha: 0.8)),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLow,
                    border: Border(
                      bottom: BorderSide(color: cs.outlineVariant),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Salt Name',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Mass (grams)',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...result.substances.map((sub) {
                  final name = nameMap[sub.substanceId] ?? '#${sub.substanceId}';
                  return Container(
                    width: 400,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: cs.onSurface,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            '${sub.weight.toStringAsFixed(2)} g',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: cs.primary,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _concentrationTable(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    CalculationResult result,
  ) {
    final elements = <Element>{
      ...result.achievedConcentrations.keys,
      ...result.targetConcentrations.keys,
    }.toList()
      ..sort((a, b) => a.symbol.compareTo(b.symbol));

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: cs.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Concentration Analysis',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: cs.onSecondary,
                  ),
                ),
                const Spacer(),
                Icon(Icons.analytics, color: cs.onSecondary.withValues(alpha: 0.8)),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLow,
                    border: Border(
                      bottom: BorderSide(color: cs.outlineVariant),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          'Element',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Result (ppm)',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Gross Error',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Instru. Error',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...elements.map((elem) {
                  final achieved = result.achievedConcentrations[elem] ?? 0.0;
                  final ge = result.grossErrors[elem];
                  final ie = result.instrumentalErrors[elem];
                  final isError = (ie != null && ie > 20.0);

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isError
                          ? cs.errorContainer.withValues(alpha: 0.2)
                          : null,
                      border: Border(
                        bottom: BorderSide(
                          color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            '${elem.symbol}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: cs.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            achieved.toStringAsFixed(1),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: cs.onSurface,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            ge != null ? '${ge.toStringAsFixed(1)}%' : '—',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              color: ge != null && ge > 1.0
                                  ? cs.error
                                  : Colors.green.shade600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            ie != null ? '${ie.toStringAsFixed(1)}%' : '—',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  isError ? FontWeight.bold : FontWeight.normal,
                              color: isError ? cs.error : Colors.green.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMixingInstructions(
    BuildContext context,
    ThemeData theme,
    ColorScheme cs,
    bool isWide,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Mixing Instructions (A+B Mode)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: cs.onSurface,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(height: 1, color: cs.outlineVariant),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (isWide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _partACard(context, theme, cs)),
              const SizedBox(width: 20),
              Expanded(child: _partBCard(context, theme, cs)),
            ],
          )
        else
          Column(
            children: [
              _partACard(context, theme, cs),
              const SizedBox(height: 20),
              _partBCard(context, theme, cs),
            ],
          ),
      ],
    );
  }

  Widget _partACard(BuildContext context, ThemeData theme, ColorScheme cs) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: cs.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: cs.onPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Part A: Macro & Calcium',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: cs.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _mixingStep(
              Icons.check_circle, cs.primary,
              'Dissolve Calcium Nitrate and Potassium Nitrate in 5L of warm water.',
              cs,
            ),
            const SizedBox(height: 12),
            _mixingStep(
              Icons.check_circle, cs.primary,
              'Agitate until the solution is completely clear.',
              cs,
            ),
            const SizedBox(height: 12),
            _mixingStep(
              Icons.check_circle, cs.primary,
              'Top up to final concentrate volume of 10L.',
              cs,
            ),
            const SizedBox(height: 16),
            _imagePlaceholder(context, cs),
          ],
        ),
      ),
    );
  }

  Widget _partBCard(BuildContext context, ThemeData theme, ColorScheme cs) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: cs.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'B',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: cs.onSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Part B: Sulfates & Micros',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: cs.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _mixingStep(
              Icons.check_circle, cs.secondary,
              'Dissolve Magnesium Sulfate and MKP in 5L of water.',
              cs,
            ),
            const SizedBox(height: 12),
            _mixingStep(
              Icons.check_circle, cs.secondary,
              'Add Chelated Micronutrient mix and mix thoroughly.',
              cs,
            ),
            const SizedBox(height: 12),
            _mixingStep(
              Icons.check_circle, cs.secondary,
              'Top up to final concentrate volume of 10L.',
              cs,
            ),
            const SizedBox(height: 16),
            _imagePlaceholder(context, cs),
          ],
        ),
      ),
    );
  }

  Widget _mixingStep(IconData icon, Color iconColor, String text, ColorScheme cs) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: cs.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  Widget _imagePlaceholder(BuildContext context, ColorScheme cs) {
    return Container(
      width: double.infinity,
      height: 128,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          color: cs.outlineVariant,
          size: 48,
        ),
      ),
    );
  }
}
