import 'package:calculator_app/logic/cubit/answer_cubit.dart';
import 'package:calculator_app/logic/cubit/input_cubit.dart';
import 'package:calculator_app/core/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<InputCubit, InputState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    state.input,
                    style: textTheme.headline1.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            BlocBuilder<AnswerCubit, AnswerState>(builder: (context, state) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  state.answer.toString(),
                  style: textTheme.headline2.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
