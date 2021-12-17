import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  final _primaryColor = Color(0xfff4ab41);

  //
  static TextTheme _lightTextTheme = TextTheme(
    headline1: GoogleFonts.mulish(
      fontSize: 45.sp,
      fontWeight: FontWeight.w400,
      height: 2.sp,
      color: Colors.black,
    ),
    headline2: GoogleFonts.mulish(
      fontSize: 28.sp,
      fontWeight: FontWeight.w200,
      color: Colors.black54,
    ),
  );
  static TextTheme _darkTextTheme = TextTheme();

  static ThemeData lightTheme() {
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

  static ThemeData darkTheme() {
    return ThemeData(
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      textTheme: _darkTextTheme,
      primaryColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      primaryColor: Colors.blue,
    );
  }
}
