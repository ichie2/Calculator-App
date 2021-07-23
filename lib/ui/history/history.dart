import 'package:calculator_app/ui/history/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History extends StatelessWidget {
  const History({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var screen = ScreenUtil();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        title: Text(
          "History",
          style: TextStyle(color: Colors.black, fontSize: screen.setSp(20)),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: HBody(),
      ),
    );
  }
}
