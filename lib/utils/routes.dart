import 'package:calculator_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoutGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (args) {
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case "":
    }
    return args;
  }
}
