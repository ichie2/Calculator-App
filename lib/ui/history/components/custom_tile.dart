import 'package:calculator_app/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key key,
    @required this.theme,
    @required this.screen,
  }) : super(key: key);

  final ThemeData theme;
  final ScreenUtil screen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "20 Tue Jan",
        style: TextStyle(color: Colors.grey),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
                text: "308",
                children: [
                  TextSpan(
                      text: "x",
                      style: TextStyle(
                          color: theme.accentColor,
                          letterSpacing: 10,
                          fontSize: screen.setSp(20),
                          fontWeight: FontWeight.w400)),
                  TextSpan(text: "42", style: newMethod(screen))
                ],
                style: newMethod(screen)),
          ),
          sizedBox(
            height: screen.setHeight(10),
          ),
          Text("12,936",
              style: TextStyle(
                color: Colors.black,
                fontSize: screen.setSp(40),
                fontFamily: "Roboto",
              ))
        ],
      ),
    );
  }
}

TextStyle newMethod(ScreenUtil screen) {
  return TextStyle(
    letterSpacing: 1,
    color: Colors.black,
    fontSize: screen.setSp(18),
    fontFamily: "Roboto",
  );
}
