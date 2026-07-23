import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/dashboard/presentation/screens/design_system_demo_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dev/design-system',
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const _PlaceholderScreen(title: 'Dashboard'),
      ),
      GoRoute(
        path: '/dashboard/test',
        builder: (context, state) => const _PlaceholderScreen(title: 'Test'),
      ),
      GoRoute(
        path: '/dev/design-system',
        builder: (context, state) => const DesignSystemDemoScreen(),
      ),
    ],
  );
});

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title)));
  }
}