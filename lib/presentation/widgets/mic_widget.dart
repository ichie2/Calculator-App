import 'package:calculator_app/core/exports.dart';

class DraggableMic extends StatefulWidget {
  final Key key;

  DraggableMic({
    this.key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DraggableMicState();
}

class _DraggableMicState extends State<DraggableMic> {
  Offset position = Offset(20.0, 20.0);
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      left: position.dx,
      top: position.dy,
      child: Draggable(
        feedback: Container(),
        child: FloatingActionButton(
          onPressed: () {
            //
          },
          child: Text("T"),
        ),
        onDragEnd: (details) {
          setState(() {
            position = details.offset;
          });
        },
      ),
    );
  }
}
