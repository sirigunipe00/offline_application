import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offline_first/styles/color_scheme.dart';


class AppMaterialTheme {
  const AppMaterialTheme._();

  static final lightTheme = _buildTheme(lightColorScheme);
  static final darkTheme = _buildTheme(darkColorScheme);

  static ThemeData _buildTheme(ColorScheme scheme) => ThemeData(
        fontFamily: 'Urbanist',
        textTheme: GoogleFonts.quicksandTextTheme(),
        colorScheme: scheme,
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(),
          ),
        ),
        brightness: scheme.brightness,
      );
}
