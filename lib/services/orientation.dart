import 'package:flutter/material.dart';

class ResponsiveWidget extends StatefulWidget {
  final Widget potraitMode;
  final Widget landscapeMode;

  const ResponsiveWidget({Key key, this.potraitMode, this.landscapeMode})
      : super(key: key);

  @override
  _ResponsiveWidgetState createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 768) {
          return widget.potraitMode;
        } else {
          return widget.landscapeMode;
        }
      },
    );
  }
}
