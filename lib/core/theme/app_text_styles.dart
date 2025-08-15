import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font Family
  static const String fontFamily = 'Roboto';

  // Display Styles
  static final TextStyle displayLarge = GoogleFonts.notoSans(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.white,
  );

  static final TextStyle displayMedium = GoogleFonts.notoSans(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.25,
    color: AppColors.white,
  );

  static final TextStyle displaySmall = GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Headline Styles
  static final TextStyle headlineLarge = GoogleFonts.notoSans(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  static final TextStyle headlineMedium = GoogleFonts.notoSans(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.25,
    color: AppColors.textPrimary,
  );

  static final TextStyle headlineSmall = GoogleFonts.notoSans(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Title Styles
  static final TextStyle titleLarge = GoogleFonts.notoSans(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static final TextStyle titleMedium = GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static final TextStyle titleSmall = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.gray700,
  );

  // Body Styles
  static final TextStyle bodyLarge = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyMedium = GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodySmall = GoogleFonts.notoSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.4,
    color: AppColors.textPrimary,
  );

  // Label Styles
  static final TextStyle labelLarge = GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static final TextStyle labelMedium = GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.white,
  );

  static final TextStyle labelSmall = GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColors.white,
  );

  // Button Styles
  static final TextStyle buttonLarge = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.white,
  );

  static final TextStyle buttonMedium = GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.white,
  );

  static final TextStyle buttonSmall = GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.white,
  );

  // Caption Styles
  static final TextStyle caption = GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
  );

  static final TextStyle overline = GoogleFonts.notoSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 1.5,
    color: AppColors.textSecondary,
  );

  // Custom Styles
  static TextStyle get primaryText =>
      bodyLarge.copyWith(color: AppColors.primary);

  static TextStyle get secondaryText =>
      bodyLarge.copyWith(color: AppColors.secondary);

  static TextStyle get successText =>
      bodyLarge.copyWith(color: AppColors.success);

  static TextStyle get errorText => bodyLarge.copyWith(color: AppColors.error);

  static TextStyle get warningText =>
      bodyLarge.copyWith(color: AppColors.warning);

  static TextStyle get infoText => bodyLarge.copyWith(color: AppColors.info);

  static TextStyle get disabledText =>
      bodyLarge.copyWith(color: AppColors.textDisabled);
}
