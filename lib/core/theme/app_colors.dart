import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xff001EE6);
  static const Color primaryLight = Color(0xff0047B1);
  static const Color primaryDark = Color(0xFF1976D2);

  static const Color sec = Color(0xff0047B1);

  // Secondary Colors
  static const Color secondary = Color(0xff0047B1);
  static const Color secondaryLight = Color(0xffDBEAFE);
  static const Color secondaryDark = Color(0xFFF57C00);

  // Accent Colors
  static const Color accent = Color(0xFF4CAF50);
  static const Color accentLight = Color(0xFF81C784);
  static const Color accentDark = Color(0xFF388E3C);

  // Additional Colors
  static const Color accentBlue = Color(0xffDBEAFE);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  // Gray Scale
  // static const Color gray50 = Color(0xFFFAFAFA);
  // static const Color gray100 = Color(0xFFF5F5F5);
  // static const Color gray200 = Color(0xFFEEEEEE);
  // static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xff525252);

  static const Color gray700 = Color(0xff525252);
  static const Color gray800 = Color(0xff1A1A1A);
  static const Color gray900 = Color(0xff374151);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xff93C5FD);

  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textDisabled = Color(0xFFE0E0E0);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFF5F5F5);
  static const Color borderDark = Color(0xFFBDBDBD);

  // Shadow Colors
  static const Color shadow = Color(0x1F000000);
  static const Color shadowLight = Color(0x0A000000);
  static const Color shadowDark = Color(0x33000000);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xff001EE6),
      Color(0xff031BBB),
      Color(0xff0117AF),
      Color(0xff00138F),
    ],

    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xff60A5FA), Color(0xffBFDBFE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient thirdGradient = LinearGradient(
    colors: [
      Color(0xff00138F),
      Color(0xff0117AF),
      Color(0xff031BBB),
      Color(0xff001EE6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
