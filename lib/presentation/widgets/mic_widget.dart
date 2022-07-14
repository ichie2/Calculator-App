import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/constants/string_constants.dart';
import 'package:calculator_app/core/exports.dart';
import 'package:calculator_app/logic/cubit/input_cubit.dart';
import 'package:calculator_app/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DraggableMic extends StatefulWidget {
  final Key key;

  DraggableMic({
    this.key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DraggableMicState();
}

class _DraggableMicState extends State<DraggableMic> {
  // initial position
  Offset position = Offset(20.0, 100.0);

  @override
  Widget build(BuildContext context) {
    final con = context.read<InputCubit>();
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (_, state) {
        if (state is InternetConnected) {
          con.speak();
        }
        con.stop();
      },
      builder: (context, state) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 100),
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: Container(),
            child: FloatingActionButton(
              tooltip: "Voice Assistance",
              backgroundColor: state is InternetConnected ? active : disabled,
              onPressed: () {
                // activate voice mode
                con.speak();
              },
              child: Lottie.asset(
                state is InternetConnected ? busy : idle,
                width: 100.w,
                height: 100.h,
              ),
            ),
            onDragEnd: (details) {
              setState(() {
                position = details.offset;
              });
            },
          ),
        );
      },
    );
  }
}
