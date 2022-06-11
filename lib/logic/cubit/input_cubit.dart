import 'package:bloc/bloc.dart';
import 'package:calculator_app/logic/cubit/answer_cubit.dart';
import 'package:meta/meta.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  final AnswerCubit answerCubit;

  InputCubit(this.answerCubit) : super(InputState(input: "0"));

  // if number is equal zero (state will still be 0)
  void increment(String input) {
    final chars = state.input;
    if (chars == "0" && input == "0") {
      // emit(InputState(input: "0"));
    } else if (input == "C") {
      answerCubit.clear();
      emit(InputState(input: "0"));
    } else if (input == "⌦" && chars.isNotEmpty) {
      final chars = state.input;
      emit(InputState(input: state.input.substring(0, chars.length - 1)));
    } else if (chars.startsWith("0") && input != "⌦") {
      emit(InputState(input: input));
    } else if (!chars.startsWith("0") && input != "⌦") {
      emit(InputState(input: chars + input));
    }
  }

  // Get expression and evaluate it
  void evalute() {
    final input = state.input;

    bool containsChar = input.contains("÷") ||
        input.contains("-") ||
        input.contains("+") ||
        input.contains("x") ||
        input.contains("%");

    bool doesntEndWithChars = !input.endsWith("÷") ||
        !input.endsWith("-") ||
        !input.endsWith("+") ||
        !input.endsWith("x") ||
        !input.endsWith("%");

    if (containsChar && doesntEndWithChars) {
      answerCubit.evalute(input);
    } else {
      // do nothing
    }
  }
}
