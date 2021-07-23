import 'package:calculator_app/ui/history/history.dart';
import 'package:calculator_app/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberBoard extends StatelessWidget {
  const NumberBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var screen = ScreenUtil();
    return GestureDetector(
      onTap: () {
        print("history......");
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return History();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        height: height / 3.5,
        width: width,
        child: Column(
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
                  fontSize: screen.setSp(60),
                  fontFamily: "Roboto",
                ))
          ],
        ),
      ),
    );
  }

  TextStyle newMethod(ScreenUtil screen) {
    return TextStyle(
      letterSpacing: 1,
      color: Colors.black,
      fontSize: screen.setSp(28),
      fontFamily: "Roboto",
    );
  }
}
