import 'package:flutter/material.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/buttons.dart';
import '../../../../core/design_system/widgets/cards.dart';
import '../../../../core/design_system/widgets/person_avatar_tile.dart';
import '../../../../core/design_system/widgets/section_collapsible.dart';
import '../../../../core/design_system/widgets/progress_bar_soft.dart';

class DesignSystemDemoScreen extends StatelessWidget {
  const DesignSystemDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          HeroCard(child: Text('HeroCard', style: Theme.of(context).textTheme.titleLarge)),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(label: 'Primary Button', onPressed: () {}),
          const SizedBox(height: AppSpacing.sm),
          SecondaryButton(label: 'Secondary Button', onPressed: () {}),
          const SizedBox(height: AppSpacing.lg),
          const CompactCard(child: Text('CompactCard')),
          const SizedBox(height: AppSpacing.lg),
          const PersonAvatarTile(name: 'Sarah Ngarmbatina', subtitle: 'Étudiante'),
          const SizedBox(height: AppSpacing.lg),
          SectionCollapsible(
            title: 'Section pliable',
            child: const Text('Contenu affiché quand ouvert.'),
          ),
          const SizedBox(height: AppSpacing.lg),
          const ProgressBarSoft(value: 0.7),
        ],
      ),
    );
  }
}