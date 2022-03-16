import 'package:calculator_app/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class Potrait extends StatefulWidget {
  const Potrait({Key key}) : super(key: key);

  @override
  _PotraitState createState() => _PotraitState();
}

class _PotraitState extends State<Potrait> {
  //
  final GlobalKey _floatingKey = GlobalKey();

  Size _floatingSize;
  Offset _floatLocation = Offset(0, 140);

  void getFloatingBox() {
    RenderBox renderbox = _floatingKey.currentContext.findRenderObject();
    _floatingSize = renderbox.size;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getFloatingBox();
    });
  }

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
                  ResultWidget(theme: theme),
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
                        child: Column(children: [
                          SizedBox(height: 10.h),
                          indicatorWidget(theme),
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
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        key: _floatingKey,
        onVerticalDragUpdate: (details) => onDragUpdate(context, details),
        onHorizontalDragUpdate: (details) => onDragUpdate(context, details),
        // onVerticalDragEnd: (details) => onDragEnd(context, details),
        // onHorizontalDragEnd: (details) => onDragEnd(context, details),
        child: Stack(
          children: [
            AnimatedPositioned(
              left: _floatLocation.dx,
              top: _floatLocation.dy,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                  onPressed: () {
                    //
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onDragEnd(BuildContext context, DragEndDetails details) {
    final double pointX = context.size.width / 2;

    if (_floatLocation.dx > pointX) {
      setState(() {
        _floatLocation = Offset(0, _floatLocation.dy);
      });
    } else {
      setState(() {
        _floatLocation = Offset(context.size.width - 50, _floatLocation.dy);
      });
    }
  }

  void onDragUpdate(BuildContext context, DragUpdateDetails details) {
    final RenderBox _box = context.findRenderObject();
    final Offset _offset = _box.globalToLocal(details.globalPosition);

    //screen view
    final double startX = 0;
    final double endX = context.size.width - _floatingSize.width;
    final double startY = MediaQuery.of(context).padding.top;
    final double endY = context.size.height - _floatingSize.height;
    print("draggin bool 1 postion : ${startX < _offset.dx}");
    print("draggin bool 1 : ${_offset.dx < endX}");
    print("draggin bool 2 postion : ${startY < _offset.dy}");
    print("draggin bool 2 : ${_offset.dy < endY}");

    // make sure widget is not off screen area
    if (startX < _offset.dx && _offset.dx < endX) {
      if (startY < _offset.dy && _offset.dy < endY) {
        _floatLocation = Offset(_offset.dx, _offset.dy);
        setState(() {});
        // print(_floatLocation);
      }
    }
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key key,
    @required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "262,262 + 265",
              style: theme.textTheme.headline1.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "262,527",
              style: theme.textTheme.headline2.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
