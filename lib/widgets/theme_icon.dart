import 'package:flutter/material.dart';

class ThemeIcon extends StatefulWidget {
  final IconData icon;
  final Function onPressed;
  final Color color;

  const ThemeIcon({Key key, this.icon, this.onPressed, this.color})
      : super(key: key);
  @override
  _ThemeIconState createState() => _ThemeIconState();
}

class _ThemeIconState extends State<ThemeIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Icon(
          widget.icon,
          color: widget.color,
        ),
      ),
    );
  }
}
