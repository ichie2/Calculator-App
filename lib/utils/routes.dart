import 'package:calculator_app/utils/exports.dart';

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
