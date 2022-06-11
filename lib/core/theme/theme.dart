import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/core/exports.dart';

class CustomTheme {
  static Color _primaryColor = Color(0xfff4ab41);

  //
  static TextTheme _lightTextTheme = TextTheme(
    headline1: GoogleFonts.mulish(
      fontSize: 45.sp,
      fontWeight: FontWeight.w400,
      height: 2.sp,
      color: blackTextColor,
    ),
    headline2: GoogleFonts.mulish(
      fontSize: 28.sp,
      fontWeight: FontWeight.w200,
      color: blackTextColor,
    ),
    bodyText2: GoogleFonts.mulish(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: blackTextColor,
    ),
  );
  static const TextTheme _darkTextTheme = TextTheme();

  static ThemeData lightTheme() {
    return ThemeData(
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      textTheme: _lightTextTheme,
      primaryColorBrightness: Brightness.light,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      accentColor: greyTextColor,
      primaryColor: _primaryColor,
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
