import 'package:calculator_app/modules/home/landscape.dart';
import 'package:calculator_app/modules/home/potrait_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Container(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, transition) {
            return ScaleTransition(
              scale: transition,
              child: child,
            );
          },
          child: orientation == Orientation.landscape ? Landscape() : Potrait(),
        ),
      ),
    );
  }
}
