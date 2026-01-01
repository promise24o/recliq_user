import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _lightColorScheme = ColorScheme.light(
    primary: Color(0xFF4CA771), // Main green
    secondary: Color(0xFFC0E6BA), // Light green
    tertiary: Color(0xFFEAF9E7), // Very light green
    background: Colors.white,
    surface: Colors.white,
    error: Color(0xFFBA1A1A),
    onPrimary: Colors.white,
    onSecondary: Color(0xFF013237), // Dark green
    onTertiary: Color(0xFF013237), // Dark green
    onBackground: Color(0xFF013237),
    onSurface: Color(0xFF013237),
    onError: Colors.white,
  );

  static final _darkColorScheme = ColorScheme.dark(
    primary: Color(0xFF4CA771), // Main green
    secondary: Color(0xFFC0E6BA), // Light green
    tertiary: Color(0xFFEAF9E7), // Very light green
    background: Color(0xFF013237), // Dark green
    surface: Color(0xFF013237), // Dark green
    error: Color(0xFFFFB4AB),
    onPrimary: Color(0xFF013237),
    onSecondary: Color(0xFF013237),
    onTertiary: Color(0xFF013237),
    onBackground: Colors.white,
    onSurface: Colors.white,
    onError: Color(0xFF690005),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
