import 'package:calculator_app/ui/history/components/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HBody extends StatefulWidget {
  const HBody({Key key}) : super(key: key);

  @override
  _HBodyState createState() => _HBodyState();
}

class _HBodyState extends State<HBody> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var screen = ScreenUtil();
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: height / 7,
                width: width,
                child: CustomTile(theme: theme, screen: screen)),
          );
        },
      ),
    );
  }
}
