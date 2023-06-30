import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_notes/constant/common.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    cardTheme: const CardTheme(color: Colors.white),
    textTheme: TextTheme(
      bodyLarge: kBodyLarge,
      bodyMedium: kBodyMedium,
      bodySmall: kBodySmall,
    ),
    scaffoldBackgroundColor: AppColors.background,
    dividerColor: AppColors.border,
  );
}

final kBodyLarge = GoogleFonts.inter(
  color: AppColors.primaryText,
  fontSize: AppFontSize.h1,
  fontWeight: FontWeight.w700,
);

final kBodyMedium = GoogleFonts.lato(
  color: AppColors.primaryText,
  fontSize: AppFontSize.h3,
  fontWeight: FontWeight.w700,
);

final kBodySmall = GoogleFonts.lato(
  color: AppColors.primaryText,
  fontSize: AppFontSize.h4,
  fontWeight: FontWeight.w700,
);

class AppFontSize {
  const AppFontSize._();

  static const double h1 = 26;
  static const double h2 = 20;
  static const double h3 = 18;
  static const double h4 = 16;
  static const double h5 = 14;
  static const double h6 = 12;
}

class AppColors {
  const AppColors._();

  static const Color background = Color(0xFFF2F6FA);
  static const Color primary = Color(0xFF2196F3);

  static const Color primaryText = Color(0xFF1B1C1C);
  static const Color grayText = Color(0xFF676A6A);

  static const Color white = Color(0xFFFFFFFF);

  static const Color border = Color(0xFFD4D7D7);

  static const Color success = Color(0xFF5DC3AF);
  static const Color error = Color(0xFFFC3123);
}

class AppButtonStyle {
  const AppButtonStyle._();

  static TextStyle primaryButtonText = GoogleFonts.lato(
    color: AppColors.primaryText,
    fontSize: AppFontSize.h3,
    fontWeight: FontWeight.w700,
  );
}

class AppInputStyle {
  const AppInputStyle._();

  static Color fillColor = AppColors.white;

  static TextStyle labelStyle = GoogleFonts.inter(
    color: AppColors.grayText,
    fontSize: AppFontSize.h4,
    fontWeight: FontWeight.w700,
  );

  static InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: const BorderSide(
      color: AppColors.primary,
    ),
  );

  static InputBorder focusedBorder = border.copyWith();

  static InputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  );
}
