import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrobuddy/ui/screens/calculator_screen.dart';
import 'package:hydrobuddy/ui/screens/substances_screen.dart';
import 'package:hydrobuddy/ui/screens/substance_editor_screen.dart';
import 'package:hydrobuddy/ui/screens/formulation_history_screen.dart';
import 'package:hydrobuddy/ui/widgets/snapshot_timeline.dart';
import 'package:hydrobuddy/ui/screens/tank_history_screen.dart';
import 'package:hydrobuddy/ui/screens/prepare_tank_screen.dart';
import 'package:hydrobuddy/ui/screens/water_quality_screen.dart';
import 'package:hydrobuddy/ui/screens/water_quality_editor_screen.dart';
import 'package:hydrobuddy/ui/screens/tissue_screen.dart';
import 'package:hydrobuddy/ui/screens/tissue_editor_screen.dart';
import 'package:hydrobuddy/ui/screens/ph_screen.dart';
import 'package:hydrobuddy/ui/screens/commercial_screen.dart';
import 'package:hydrobuddy/ui/screens/commercial_comparison_screen.dart';
import 'package:hydrobuddy/ui/screens/stock_analysis_screen.dart';
import 'package:hydrobuddy/ui/screens/per_substance_screen.dart';
import 'package:hydrobuddy/ui/screens/ratio_screen.dart';
import 'package:hydrobuddy/ui/screens/mix_analysis_screen.dart';
import 'package:hydrobuddy/ui/screens/settings_screen.dart';
import 'package:hydrobuddy/ui/screens/instrument_precision_screen.dart';
import 'package:hydrobuddy/ui/screens/degree_of_freedom_screen.dart';
import 'package:hydrobuddy/ui/screens/about_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/calculator',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/calculator',
                builder: (context, state) => const CalculatorScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/substances',
                builder: (context, state) => const SubstancesScreen(),
                routes: [
                  GoRoute(
                    path: 'edit/:id',
                    builder: (context, state) => SubstanceEditorScreen(
                      substanceId: int.parse(state.pathParameters['id']!),
                    ),
                  ),
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => const SubstanceEditorScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/formulations',
                builder: (context, state) => const FormulationHistoryScreen(),
                routes: [
                  GoRoute(
                    path: ':id/snapshots',
                    builder: (context, state) => SnapshotTimeline(
                      formulationId: int.parse(state.pathParameters['id']!),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/tank',
                builder: (context, state) => const TankHistoryScreen(),
                routes: [
                  GoRoute(
                    path: 'prepare',
                    builder: (context, state) => const PrepareTankScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
                routes: [
                  GoRoute(
                    path: 'instrument-precision',
                    builder: (context, state) =>
                        const InstrumentPrecisionScreen(),
                  ),
                  GoRoute(
                    path: 'degree-of-freedom',
                    builder: (context, state) =>
                        const DegreeOfFreedomScreen(),
                  ),
                  GoRoute(
                    path: 'about',
                    builder: (context, state) => const AboutScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/water-quality',
        builder: (context, state) => const WaterQualityScreen(),
        routes: [
          GoRoute(
            path: 'edit/:id',
            builder: (context, state) => WaterQualityEditorScreen(
              waterQualityId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: 'new',
            builder: (context, state) => const WaterQualityEditorScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/tissue',
        builder: (context, state) => const TissueScreen(),
        routes: [
          GoRoute(
            path: 'edit/:id',
            builder: (context, state) => TissueEditorScreen(
              tissueId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: 'new',
            builder: (context, state) => const TissueEditorScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/ph',
        builder: (context, state) => const PhScreen(),
      ),
      GoRoute(
        path: '/commercial',
        builder: (context, state) => const CommercialScreen(),
      ),
      GoRoute(
        path: '/commercial-comparison',
        builder: (context, state) => const CommercialComparisonScreen(),
      ),
      GoRoute(
        path: '/stock-analysis',
        builder: (context, state) => const StockAnalysisScreen(),
      ),
      GoRoute(
        path: '/per-substance',
        builder: (context, state) => const PerSubstanceScreen(),
      ),
      GoRoute(
        path: '/ratios',
        builder: (context, state) => const RatioScreen(),
      ),
      GoRoute(
        path: '/mix-analysis',
        builder: (context, state) => const MixAnalysisScreen(),
      ),
    ],
  );
});

/// Shell widget que fornece o [NavigationBar] (M3) comum a todas as telas.
class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined),
            selectedIcon: Icon(Icons.calculate),
            label: 'Calculadora',
          ),
          NavigationDestination(
            icon: Icon(Icons.science_outlined),
            selectedIcon: Icon(Icons.science),
            label: 'Substâncias',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Formulações',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_drop_outlined),
            selectedIcon: Icon(Icons.water_drop),
            label: 'Tanques',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
