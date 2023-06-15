import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    cardTheme: const CardTheme(color: Colors.white),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.lato(
        color: AppColors.primaryText,
        fontSize: 22,
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
    scaffoldBackgroundColor: Colors.white,
    dividerColor: AppColors.border,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        .copyWith(background: Colors.white),
  );
}

class AppColors {
  AppColors._();

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
