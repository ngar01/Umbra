class OnboardingStateEntity {
  final bool hasSeenIntro;
  final bool hasCreatedWorkspace;
  final bool hasCreatedFirstGroup;

  const OnboardingStateEntity({
    this.hasSeenIntro = false,
    this.hasCreatedWorkspace = false,
    this.hasCreatedFirstGroup = false,
  });

  bool get isComplete =>
      hasSeenIntro && hasCreatedWorkspace && hasCreatedFirstGroup;

  OnboardingStateEntity copyWith({
    bool? hasSeenIntro,
    bool? hasCreatedWorkspace,
    bool? hasCreatedFirstGroup,
  }) {
    return OnboardingStateEntity(
      hasSeenIntro: hasSeenIntro ?? this.hasSeenIntro,
      hasCreatedWorkspace: hasCreatedWorkspace ?? this.hasCreatedWorkspace,
      hasCreatedFirstGroup: hasCreatedFirstGroup ?? this.hasCreatedFirstGroup,
    );
  }
}