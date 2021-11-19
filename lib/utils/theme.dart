import 'package:flutter/material.dart';

bool global = true;

class CustomTheme {
  static ThemeData getTheme() {
    if (global) {
      return _lightTheme();
    } else {
      return _darkTheme();
    }
  }

  static TextTheme _lightTextTheme = TextTheme();
  static TextTheme _darkTextTheme = TextTheme();

  static ThemeData _lightTheme() {
    return ThemeData(
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      textTheme: _lightTextTheme,
      primaryColorBrightness: Brightness.light,
    );
  }

  static ThemeData _darkTheme() {
    return ThemeData(
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      textTheme: _darkTextTheme,
      primaryColorBrightness: Brightness.dark,
    );
  }
}
