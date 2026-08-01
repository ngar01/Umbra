import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';
import '../tokens/radius.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.surfacePrimaryLight,
    cardColor: AppColors.surfaceSecondaryLight, // ← la ligne qui manquait
    colorScheme: ColorScheme.light(
      surface: AppColors.surfacePrimaryLight,
      primary: AppColors.accentGold,
      secondary: AppColors.accentOlive,
    ),
    textTheme: AppTypography.textTheme(AppColors.textPrimaryLight),
    cardTheme: CardThemeData(
      color: AppColors.surfaceSecondaryLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    ),
    useMaterial3: true,
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.surfacePrimaryDark,
    cardColor: AppColors.surfaceSecondaryDark, // ← la ligne qui manquait
    colorScheme: ColorScheme.dark(
      surface: AppColors.surfacePrimaryDark,
      primary: AppColors.accentGold,
      secondary: AppColors.accentOlive,
    ),
    textTheme: AppTypography.textTheme(AppColors.textPrimaryDark),
    cardTheme: CardThemeData(
      color: AppColors.surfaceSecondaryDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    ),
    useMaterial3: true,
  );
}