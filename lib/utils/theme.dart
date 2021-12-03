import 'package:flutter/material.dart';

var global = true;

// Color _primaryColor = Color(0xF4AB41);

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
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.grey,
      primaryColor: Colors.blue,
    );
  }

  static ThemeData _darkTheme() {
    return ThemeData(
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      textTheme: _darkTextTheme,
      primaryColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.grey,
      primaryColor: Colors.blue,
    );
  }
}
