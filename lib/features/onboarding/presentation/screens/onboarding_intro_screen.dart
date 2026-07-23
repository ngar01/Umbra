import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/buttons.dart';
import '../providers/onboarding_provider.dart';

class OnboardingSlide {
  final String title;
  final String description;
  final IconData icon;

  const OnboardingSlide({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const List<OnboardingSlide> _slides = [
  OnboardingSlide(
    title: 'Prier',
    description: 'Intercédez chaque jour pour les personnes qui vous sont confiées.',
    icon: Icons.favorite_border,
  ),
  OnboardingSlide(
    title: 'Accompagner',
    description: 'Suivez chaque personne avec attention, sans jamais rien oublier.',
    icon: Icons.people_outline,
  ),
  OnboardingSlide(
    title: 'Multiplier',
    description: 'Faites grandir votre groupe et voyez le fruit de votre travail.',
    icon: Icons.eco_outlined,
  ),
];

class OnboardingIntroScreen extends ConsumerStatefulWidget {
  const OnboardingIntroScreen({super.key});

  @override
  ConsumerState<OnboardingIntroScreen> createState() => _OnboardingIntroScreenState();
}

class _OnboardingIntroScreenState extends ConsumerState<OnboardingIntroScreen> {
  final _controller = PageController();
  int _index = 0;

  void _next() {
    if (_index < _slides.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
    } else {
      ref.read(onboardingProvider.notifier).markIntroSeen();
      context.go('/onboarding/account');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  final slide = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(slide.icon, size: 72),
                        const SizedBox(height: AppSpacing.xl),
                        Text(slide.title, style: Theme.of(context).textTheme.displayLarge),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          slide.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                    (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == _index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: PrimaryButton(
                label: _index == _slides.length - 1 ? 'Commencer' : 'Suivant',
                onPressed: _next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}