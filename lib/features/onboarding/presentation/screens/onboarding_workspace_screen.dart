import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/buttons.dart';
import '../providers/onboarding_provider.dart';
import 'package:uuid/uuid.dart';
import '../../../members/domain/entities/workspace_entity.dart';
import '../../../members/domain/entities/group_entity.dart';
import '../providers/workspace_group_providers.dart';
import '../../../../core/navigation/current_context_provider.dart';

class OnboardingWorkspaceScreen extends ConsumerStatefulWidget {
  const OnboardingWorkspaceScreen({super.key});

  @override
  ConsumerState<OnboardingWorkspaceScreen> createState() => _OnboardingWorkspaceScreenState();
}

class _OnboardingWorkspaceScreenState extends ConsumerState<OnboardingWorkspaceScreen> {
  final _groupNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _groupNameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  Future<void> _createFirstGroup() async {
    final workspaceRepo = ref.read(workspaceRepositoryProvider);
    final groupRepo = ref.read(groupRepositoryProvider);
    const uuid = Uuid();

    final workspaceId = uuid.v4();
    final groupId = uuid.v4();

    await workspaceRepo.create(WorkspaceEntity(
      id: workspaceId,
      name: '${_groupNameController.text.trim()} — Espace',
      createdAt: DateTime.now(),
    ));

    await groupRepo.create(GroupEntity(
      id: groupId,
      workspaceId: workspaceId,
      name: _groupNameController.text.trim(),
      createdAt: DateTime.now(),
    ));

    ref.read(currentWorkspaceIdProvider.notifier).state = workspaceId;
    ref.read(currentGroupIdProvider.notifier).state = groupId;

    ref.read(onboardingProvider.notifier).markWorkspaceCreated();
    ref.read(onboardingProvider.notifier).markFirstGroupCreated();

    if (mounted) context.go('/dashboard');
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
                    : () => _createFirstGroup(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}