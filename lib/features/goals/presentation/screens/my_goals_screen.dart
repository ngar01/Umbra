import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/cards.dart';
import '../../../../core/design_system/widgets/buttons.dart';
import '../../domain/entities/goal_entity.dart';
import '../providers/goal_providers.dart';

class MyGoalsScreen extends ConsumerWidget {
  const MyGoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(myGoalsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes objectifs')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddGoalSheet(context, ref),
        child: const Icon(Icons.add),
      ),
      body: goalsAsync.when(
        data: (goals) {
          if (goals.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  'Aucun objectif pour l\'instant.\nAjoutez-en un, personnel ou reçu de votre responsable.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: goals.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, i) {
              final goal = goals[i];
              return CompactCard(
                onTap: goal.status == GoalStatus.active
                    ? () => ref.read(goalRepositoryProvider).markDone(goal.id)
                    : null,
                child: Row(
                  children: [
                    Icon(
                      goal.status == GoalStatus.done
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(goal.title),
                          if (goal.source == GoalSource.assigned)
                            Text(
                              'Reçu de ${goal.assignedByName ?? "votre responsable"}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Erreur : $e')),
      ),
    );
  }

  void _showAddGoalSheet(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final assignedByController = TextEditingController();
    GoalSource source = GoalSource.self;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            top: AppSpacing.lg,
            bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nouvel objectif', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.md),
              SegmentedButton<GoalSource>(
                segments: const [
                  ButtonSegment(value: GoalSource.self, label: Text('Personnel')),
                  ButtonSegment(value: GoalSource.assigned, label: Text('Reçu d\'un responsable')),
                ],
                selected: {source},
                onSelectionChanged: (s) => setModalState(() => source = s.first),
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titre (ex: Lire Jean, Jeûner le mardi)'),
                onChanged: (_) => setModalState(() {}),
              ),
              if (source == GoalSource.assigned) ...[
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: assignedByController,
                  decoration: const InputDecoration(labelText: 'Donné par (ex: Esther, responsable de réseau)'),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: 'Ajouter',
                onPressed: titleController.text.trim().isEmpty
                    ? null
                    : () {
                  ref.read(goalRepositoryProvider).create(GoalEntity(
                    id: const Uuid().v4(),
                    ownerType: GoalOwnerType.user,
                    ownerId: currentUserId,
                    title: titleController.text.trim(),
                    source: source,
                    assignedByName: source == GoalSource.assigned
                        ? assignedByController.text.trim()
                        : null,
                    createdAt: DateTime.now(),
                  ));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}