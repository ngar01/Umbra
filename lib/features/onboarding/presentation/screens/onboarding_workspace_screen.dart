import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/buttons.dart';
import '../providers/onboarding_provider.dart';

class OnboardingWorkspaceScreen extends ConsumerStatefulWidget {
  const OnboardingWorkspaceScreen({super.key});

  @override
  ConsumerState<OnboardingWorkspaceScreen> createState() => _OnboardingWorkspaceScreenState();
}

class _OnboardingWorkspaceScreenState extends ConsumerState<OnboardingWorkspaceScreen> {
  final _groupNameController = TextEditingController();

  void _createFirstGroup() {
    // En Phase 1, on a le repository members mais pas encore de repository
    // workspace/group dédié — on le posera ici dans la prochaine tranche.
    // Pour l'instant, on marque juste l'étape comme complète.
    ref.read(onboardingProvider.notifier).markWorkspaceCreated();
    ref.read(onboardingProvider.notifier).markFirstGroupCreated();
    context.go('/dashboard');
  }

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
              Text('Nommez votre groupe', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Ex : "Cellule Jeunes Brest", "Réseau Nord"',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: _groupNameController,
                decoration: const InputDecoration(labelText: 'Nom du groupe'),
              ),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                label: 'Créer mon espace',
                onPressed: _groupNameController.text.trim().isEmpty
                    ? null
                    : _createFirstGroup,
              ),
            ],
          ),
        ),
      ),
    );
  }
}