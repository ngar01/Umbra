import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radius.dart';

class ProgressBarSoft extends StatelessWidget {
  final double value; // 0.0 to 1.0

  const ProgressBarSoft({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.full),
      child: LinearProgressIndicator(
        value: value.clamp(0.0, 1.0),
        minHeight: 8,
        backgroundColor: AppColors.borderLight,
        valueColor: const AlwaysStoppedAnimation(AppColors.accentOlive),
      ),
    );
  }
}