import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/dashboard/presentation/screens/design_system_demo_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_account_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_intro_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_workspace_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/dashboard/test',
        builder: (context, state) => const _PlaceholderScreen(title: 'Test'),
      ),
      GoRoute(
        path: '/dev/design-system',
        builder: (context, state) => const DesignSystemDemoScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingIntroScreen(),
      ),
      GoRoute(
        path: '/onboarding/account',
        builder: (context, state) => const OnboardingAccountScreen(),
      ),
      GoRoute(
        path: '/onboarding/workspace',
        builder: (context, state) => const OnboardingWorkspaceScreen(),
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