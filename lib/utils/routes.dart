import 'package:calculator_app/modules/history/history.dart';
import 'package:calculator_app/modules/home/home.dart';
import 'package:calculator_app/modules/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoutGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (args) {
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case "history":
        return MaterialPageRoute(builder: (_) => History());
        break;
      case "setting":
        return MaterialPageRoute(builder: (_) => Setting());
        break;
    }
    return args;
  }
}
