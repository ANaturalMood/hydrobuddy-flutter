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
        ],
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
        ],
      ),
    );
  }
}
