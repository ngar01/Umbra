import 'package:flutter/material.dart';
import '../tokens/radius.dart';
import '../tokens/spacing.dart';

class HeroCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const HeroCard({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: isDark
            ? null
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}

class CompactCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const CompactCard({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: child,
      ),
    );
  }
}