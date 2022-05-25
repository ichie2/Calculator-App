import 'package:calculator_app/utils/exports.dart';

class MicWidget extends StatefulWidget {
  const MicWidget({Key key}) : super(key: key);
  @override
  _MicWidgetState createState() => _MicWidgetState();
}

class _MicWidgetState extends State<MicWidget> {
  @override
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
