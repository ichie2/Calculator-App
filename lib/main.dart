import 'package:calculator_app/modules/home/home.dart';
import 'package:calculator_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: Size(375, 825),
      builder: () {
        return Phoenix(
          child: GetMaterialApp(
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            title: 'Calculator Pro',
            theme: CustomTheme.lightTheme(),
            darkTheme: CustomTheme.darkTheme(),
            home: Home(),
          ),
        );
      },
    );
  }
}
