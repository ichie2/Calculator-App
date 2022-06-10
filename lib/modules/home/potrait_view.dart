import 'package:calculator_app/constants/character_constants.dart';
import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/utils/exports.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getFloatingBox();
    });
  }

  // Global Key
  final GlobalKey _floatingKey = GlobalKey();

  //
  Size _widgetSize;
  Offset _floatLocation = Offset(0, 140);

  void getFloatingBox() {
    RenderBox renderbox = _floatingKey.currentContext.findRenderObject();
    _widgetSize = renderbox.size;
  }

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
                      maxChildSize: 0.97,
                      initialChildSize: 0.97,
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
      floatingActionButton: GestureDetector(
        key: _floatingKey,
        child: Stack(children: [
          AnimatedPositioned(
            left: _floatLocation.dx,
            right: _floatLocation.dy,
            duration: const Duration(milliseconds: 300),
            child: FloatingActionButton(
              onPressed: () {
                // use mic
              },
            ),
          ),
        ]),
        onVerticalDragUpdate: (details) => onDragUpdate(context, details),
        onHorizontalDragUpdate: (details) => onDragUpdate(context, details),
        onVerticalDragEnd: (details) => onDragEnd(context, details),
        onHorizontalDragEnd: (details) => onDragEnd(context, details),
      ),
    );
  }

  void onDragEnd(BuildContext context, DragEndDetails details) {
    final double pointX = context.size.width / 2;
    if (_floatLocation.dx > pointX) {
      _floatLocation = Offset(0, _floatLocation.dy);
    } else {
      _floatLocation = Offset(context.size.width - 50, _floatLocation.dy);
    }
    setState(() {});
  }

  void onDragUpdate(BuildContext context, DragUpdateDetails details) {
    final RenderBox _box = context.findRenderObject();
    final Offset _offset = _box.globalToLocal(details.globalPosition);

    //screen view
    final double startX = 0;
    final double endX = context.size.width - _widgetSize.width;
    final double startY = MediaQuery.of(context).padding.top;
    final double endY = context.size.height - _widgetSize.height;

    // make sure widget is not off screen area
    if (startX < _offset.dx && _offset.dx < endX) {
      if (startY < _offset.dy && _offset.dy < endY) {
        _floatLocation = Offset(_offset.dx, _offset.dy);
        setState(() {});
      }
    }
  }
}
