import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/onboarding_state_entity.dart';

class OnboardingNotifier extends StateNotifier<OnboardingStateEntity> {
  OnboardingNotifier() : super(const OnboardingStateEntity());

  void markIntroSeen() => state = state.copyWith(hasSeenIntro: true);
  void markWorkspaceCreated() => state = state.copyWith(hasCreatedWorkspace: true);
  void markFirstGroupCreated() => state = state.copyWith(hasCreatedFirstGroup: true);
}

final onboardingProvider =
StateNotifierProvider<OnboardingNotifier, OnboardingStateEntity>(
      (ref) => OnboardingNotifier(),
);