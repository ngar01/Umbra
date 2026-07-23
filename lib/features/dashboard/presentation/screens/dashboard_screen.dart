import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/cards.dart';
import '../../../../core/design_system/widgets/buttons.dart';
import '../../../../core/design_system/widgets/progress_bar_soft.dart';
import '../../../../core/navigation/current_context_provider.dart';
import '../providers/reminder_providers.dart';
import '../../../members/presentation/providers/member_providers.dart';

const List<Map<String, String>> _verses = [
  {'text': 'Celui qui demeure sous l\'abri du Très-Haut repose à l\'ombre du Tout-Puissant.', 'ref': 'Psaume 91:1'},
  {'text': 'Car je connais les projets que j\'ai formés sur vous, dit l\'Éternel.', 'ref': 'Jérémie 29:11'},
  {'text': 'Je puis tout par celui qui me fortifie.', 'ref': 'Philippiens 4:13'},
];

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupId = ref.watch(currentGroupIdProvider);

    if (groupId == null) {
      return const Scaffold(
        body: Center(child: Text('Aucun groupe actif — retournez à l\'onboarding.')),
      );
    }

    final dayIndex = DateTime.now().difference(DateTime(2026, 1, 1)).inDays % _verses.length;
    final verse = _verses[dayIndex];

    final membersAsync = ref.watch(getMembersUseCaseProvider).call(groupId);
    final callsAsync = ref.watch(callRemindersProvider(groupId));
    final visitsAsync = ref.watch(visitRemindersProvider(groupId));

    return Scaffold(
      appBar: AppBar(title: const Text('Bonjour 👋')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          HeroCard(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('"${verse['text']}"', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: AppSpacing.xs),
                Text(verse['ref']!, style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          StreamBuilder(
            stream: membersAsync,
            builder: (context, snapshot) {
              final count = snapshot.data?.length ?? 0;
              return HeroCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🙏  Prier aujourd\'hui', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      count == 0
                          ? 'Ajoutez vos premiers membres pour commencer à intercéder.'
                          : '$count personne(s) vous attendent',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    PrimaryButton(
                      label: 'Commencer mon intercession',
                      onPressed: count == 0 ? null : () {
                        // Route réelle branchée en Phase 5
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: callsAsync.when(
                  data: (calls) => CompactCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('À appeler'),
                        Text('${calls.length} personne(s)'),
                      ],
                    ),
                  ),
                  loading: () => const CompactCard(child: Text('...')),
                  error: (e, st) => const CompactCard(child: Text('—')),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: visitsAsync.when(
                  data: (visits) => CompactCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('À visiter'),
                        Text('${visits.length} personne(s)'),
                      ],
                    ),
                  ),
                  loading: () => const CompactCard(child: Text('...')),
                  error: (e, st) => const CompactCard(child: Text('—')),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Progression de la semaine', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const ProgressBarSoft(value: 0.0),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Les objectifs hebdomadaires arrivent avec le discipulat (Phase 4).',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}