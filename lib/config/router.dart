import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/calculator',
    routes: [
      GoRoute(
        path: '/calculator',
        builder: (context, state) => const _Screen(title: 'Calculator'),
      ),
      GoRoute(
        path: '/substances',
        builder: (context, state) => const _Screen(title: 'Substances'),
      ),
      GoRoute(
        path: '/formulations',
        builder: (context, state) => const _Screen(title: 'Formulations'),
      ),
      GoRoute(
        path: '/tank',
        builder: (context, state) => const _Screen(title: 'Tank'),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const _Screen(title: 'Settings'),
      ),
    ],
  );
});

class _Screen extends StatelessWidget {
  final String title;
  const _Screen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
