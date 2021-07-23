import 'package:flutter/material.dart';

Color lightColor = Color(0xffF9F9F9);
Color darkColor = Color(0xff292D36);
Color lightButton = Color(0xffF9F9F9);
ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  backgroundColor: Color(0xffffffff),
  primaryColor: Colors.blueAccent,
  accentColor: Color(0xffEE7878),
);
ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  backgroundColor: Color(0xff22252D),
  primaryColor: Colors.greenAccent,
  accentColor: Color(0xffEE7878),
);
