import 'package:flutter/material.dart';
import 'package:flutter_calculator/theme/dark_theme_preference.dart';

class ThemeService with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  ThemeData getThemeData() {
    return ThemeData(
      primaryColor: _darkTheme ? const Color(0xff22252D) : Colors.white,
      backgroundColor: _darkTheme ? const Color(0xff22252D) : Colors.white,
    );
  }
}
