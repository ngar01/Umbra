import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/buttons.dart';

class OnboardingAccountScreen extends StatefulWidget {
  const OnboardingAccountScreen({super.key});

  @override
  State<OnboardingAccountScreen> createState() => _OnboardingAccountScreenState();
}

class _OnboardingAccountScreenState extends State<OnboardingAccountScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Comment vous appelez-vous ?', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Votre nom'),
              ),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                label: 'Continuer',
                onPressed: _nameController.text.trim().isEmpty
                    ? null
                    : () => context.go('/onboarding/workspace'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}