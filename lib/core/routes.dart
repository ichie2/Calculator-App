import 'package:calculator_app/core/exports.dart';

class RouteGenerator {
  static const String home = '/home';
  static const String history = '/history';
  static const String setting = '/setting';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;
    switch (name) {
      case home:
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case history:
        return MaterialPageRoute(builder: (_) => History());
        break;
      case setting:
        return MaterialPageRoute(builder: (_) => Setting());
        break;
    }
  }
}
