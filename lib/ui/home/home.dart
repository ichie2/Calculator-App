import 'package:calculator_app/ui/home/components/theme_switcher.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.backgroundColor,
        title: SwitchWidget(),
        centerTitle: true,
      ),
      backgroundColor: theme.backgroundColor,
    );
  }
}
