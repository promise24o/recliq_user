import 'package:flutter/material.dart';

class AppTheme {
  // Core brand colors
  static const Color darkBackground = Color(0xFF050214);
  static const Color surfaceDark = Color(0xFF1A1A2E);
  static const Color primaryGreen = Color(0xFF1F6B43);
  static const Color primaryGreenSoft = Color(0xFF2E8B57);

  // Accent & semantic colors
  static const Color success = Color(0xFF34C759);
  static const Color info = Color(0xFF0A84FF);
  static const Color warning = Color(0xFFFF9F0A);
  static const Color danger = Color(0xFFFF453A);

  // Neutral palette
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB3B3C2);
  static const Color textMuted = Color(0xFF8E8EA0);

  static const Color borderSoft = Color(0xFF2A2A40);
  static const Color divider = Color(0xFF232338);

  // Overlays
  static const Color overlayLight = Color(0x1AFFFFFF);
  static const Color overlayStrong = Color(0x33FFFFFF);
  static const Color overlayWhite = Color(0xfFFFFFFF);

  // Gradients
  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1F6B43),
      Color(0xFF2E8B57),
    ],
  );

  static const LinearGradient darkSurfaceGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1A1A2E),
      Color(0xFF121226),
    ],
  );

  // Base theme (fonts preserved)
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    scaffoldBackgroundColor: darkBackground,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: textPrimary,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      iconTheme: IconThemeData(color: textPrimary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: textPrimary,
        side: const BorderSide(color: borderSoft),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    dividerColor: divider,
  );
}
