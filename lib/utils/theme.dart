import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  backgroundColor: Color(0xffE4F1FA),
  primaryColor: Color(0xffE4F1FA),
  accentColor: Color(0xff7E8FA6),
);
ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  backgroundColor: Color(0xff22252E),
  primaryColor: Color(0xffffffff),
  accentColor: Color(0xffBBB359),
);
