import 'package:calculator_app/utils/theme.dart';
import 'package:calculator_app/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Switcher extends StatelessWidget {
  const Switcher({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var screen = ScreenUtil();
    return Container(
      decoration: BoxDecoration(
          color: lightColor, borderRadius: BorderRadius.circular(20)),
      height: screen.setHeight(35),
      width: screen.setWidth(100),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.wb_sunny_outlined,
                color: darkColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.nights_stay_outlined,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
