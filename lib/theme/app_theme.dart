import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      colorScheme: const ColorScheme.dark(
        secondary: Color(0xffF9F9F9),
        primaryVariant: Color(0xff2A2D37),
        surface: Color(0xffecf0f1),
        error: Color(0XFFc0392b),
        secondaryVariant: Color(0XFF16a085),
      ),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      primaryColor: const Color(0xff22252D),
      backgroundColor: const Color(0xff22252D),
      colorScheme: const ColorScheme.dark(
        secondary: Color(0xff2A2D37),
        primaryVariant: Color(0xffF9F9F9),
        surface: Color(0xff4D505A),
        error: Color(0XFFc0392b),
        secondaryVariant: Color(0XFF16a085),
      ),
    );
  }
}
