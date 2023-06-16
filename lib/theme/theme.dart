import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_notes/app/app.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    cardTheme: const CardTheme(color: Colors.white),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: AppColors.primaryText,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.lato(
        color: AppColors.primaryText,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: GoogleFonts.lato(
        color: AppColors.primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: AppColors.background,
    dividerColor: AppColors.border,
  );
}

class AppColors {
  AppColors._();

  static const Color background = Color(0xFFF2F6FA);
  static const Color primary = Color(0xFF4FC3E3);

  static const Color primaryText = Color(0xFF1B1C1C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color success = Color(0xFF5DC3AF);
  static const Color error = Color(0xFFFC3123);
  static const Color border = Color(0xFFD4D7D7);
}

class AppButtonStyle {
  AppButtonStyle._();

  static TextStyle primaryButtonText = GoogleFonts.lato(
    color: AppColors.primaryText,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
