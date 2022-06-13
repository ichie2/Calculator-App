import 'package:calculator_app/constants/character_constants.dart';
import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/core/exports.dart';
import 'package:calculator_app/core/routes.dart';
import 'package:calculator_app/presentation/widgets/indicator_widget.dart';
import 'package:calculator_app/presentation/widgets/mic_widget.dart';
import 'package:calculator_app/presentation/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class Potrait extends StatefulWidget {
  const Potrait({Key key}) : super(key: key);

  @override
  _PotraitState createState() => _PotraitState();
}

class _PotraitState extends State<Potrait> {
  // Global Key
  final GlobalKey _floatingKey = GlobalKey();

  //
  Size _widgetSize;
  Offset _floatLocation = Offset(0, 100);

  double _percentage = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300.h,
                  width: 350.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Switcher(),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                // rotate screen
                              },
                              icon: Icon(
                                Iconsax.math,
                                color: primaryColor,
                                size: 20.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // setting page
                                Navigator.pushNamed(
                                    context, RouteGenerator.setting);
                              },
                              icon: Icon(
                                Iconsax.setting,
                                color: primaryColor,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                      child: DraggableScrollableSheet(
                        maxChildSize: 0.95,
                        initialChildSize: 0.95,
                        minChildSize: 0.5,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            color: greyTextColor.withOpacity(0.05),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(children: [
                                SizedBox(height: 10.h),
                                indicator(),
                                GridView.builder(
                                  shrinkWrap: true,
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
                                    return ButtonWidget(character: snapshot);
                                  },
                                )
                              ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DraggableMic(key: _floatingKey)
          ],
        ),
      ),
    );
  }

  void onDragEnd(BuildContext context, DragEndDetails details) {}

  void onDragUpdate(BuildContext context, DragUpdateDetails details) {
    final RenderBox renderBox = context.findRenderObject();
    Offset offset = renderBox.globalToLocal(details.globalPosition);

    // calculate screen percentage
    final double startPointX = 0;
    final double endPointX = context.size.width - _widgetSize.width;

    final double startPointY = MediaQuery.of(context).padding.top;
    final double endPointY = context.size.height - _widgetSize.height;

    if (startPointX < offset.dx && offset.dx < endPointX) {
      if (startPointY < offset.dy && offset.dy < endPointY) {
        _floatLocation = Offset(offset.dx, offset.dy);
        setState(() {});
      }
    }
  }
}
