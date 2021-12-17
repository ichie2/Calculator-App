import 'package:calculator_app/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Container(
              height: 290.h,
              width: 350.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Switcher(),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "262,262 + 265",
                            style: theme.textTheme.headline1,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "262,527",
                            style: theme.textTheme.headline2,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Material(
                  elevation: 1,
                  color: theme.backgroundColor,
                  child: DraggableScrollableSheet(
                    maxChildSize: 1.0,
                    initialChildSize: 1.0,
                    minChildSize: 0.0,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        color: theme.accentColor.withOpacity(0.05),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            indicatorWidget(theme),
                            SizedBox(
                              height: 300.h,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container indicatorWidget(ThemeData theme) {
    return Container(
      height: 6.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: theme.accentColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.sp),
      ),
    );
  }
}
