import 'package:flutter/material.dart';

class sizedBox extends StatelessWidget {
  final double height;
  final double width;

  const sizedBox({Key key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
