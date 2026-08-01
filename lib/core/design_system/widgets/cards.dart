import 'package:flutter/material.dart';
import '../tokens/radius.dart';
import '../tokens/spacing.dart';
import '../tokens/colors.dart';

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
        border: isDark
            ? Border.all(color: AppColors.borderDark, width: 1)
            : null,
        boxShadow: isDark
            ? null
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: isDark
              ? Border.all(color: AppColors.borderDark, width: 1)
              : null,
        ),
        child: child,
      ),
    );
  }
}