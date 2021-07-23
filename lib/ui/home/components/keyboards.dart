import 'package:calculator_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyBoard extends StatelessWidget {
  //list of numbers
  List<String> numbers = [
    "AC",
    "±",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "C",
    "0",
    ".",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var screen = ScreenUtil();
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: GridView.builder(
        itemCount: numbers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 25, crossAxisSpacing: 25),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: screen.setHeight(30),
            width: screen.setWidth(30),
            decoration: BoxDecoration(
                color: theme.backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                numbers[index],
                style: TextStyle(
                    fontSize: screen.setSp(20),
                    fontWeight: FontWeight.w800,
                    color: index < 3
                        ? theme.primaryColor
                        : isOperator(numbers[index])
                            ? theme.accentColor
                            : Colors.black),
              ),
            ),
          );
        },
      ),
    ));
  }

  bool isOperator(String x) {
    if (x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }
}
