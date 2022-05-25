import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/utils/exports.dart';
import 'package:calculator_app/widgets/mic_widget.dart';
import 'package:calculator_app/widgets/potrait_widgets/indicator_widget.dart';
import 'package:calculator_app/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class Potrait extends StatefulWidget {
  const Potrait({Key key}) : super(key: key);

  @override
  _PotraitState createState() => _PotraitState();
}

class _PotraitState extends State<Potrait> {
  double _percentage = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 290.h,
              width: 350.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Switcher(),
                  SizedBox(height: 20.h),
                  ResultWidget(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Material(
                  elevation: 1,
                  color: theme.backgroundColor,
                  child: NotificationListener<DraggableScrollableNotification>(
                    onNotification: (val) {
                      _percentage = 2 * val.extent;
                      return true;
                    },
                    child: DraggableScrollableSheet(
                      maxChildSize: 1.0,
                      initialChildSize: 1.0,
                      minChildSize: 0.0,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          color: greyTextColor.withOpacity(0.05),
                          child: Column(children: [
                            SizedBox(height: 10.h),
                            indicator(),
                            Container(
                              child: Flexible(
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: potraitNum.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                    ),
                                    itemBuilder: (_, index) {
                                      final snapshot = potraitNum[index];
                                      return ButtonWidget(
                                        character: snapshot,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )
                          ]),
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: MicWidget(),
    );
  }
}
