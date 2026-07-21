import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextTheme textTheme(Color textColor) {
    return TextTheme(
      displayLarge: GoogleFonts.fraunces(
        fontSize: 32, height: 1.25, fontWeight: FontWeight.w600, color: textColor,
      ),
      titleLarge: GoogleFonts.fraunces(
        fontSize: 24, height: 1.33, fontWeight: FontWeight.w600, color: textColor,
      ),
      titleMedium: GoogleFonts.fraunces(
        fontSize: 20, height: 1.4, fontWeight: FontWeight.w500, color: textColor,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 17, height: 1.4, color: textColor,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15, height: 1.45, color: textColor,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 13, height: 1.4, color: textColor,
      ),
    );
  }
}