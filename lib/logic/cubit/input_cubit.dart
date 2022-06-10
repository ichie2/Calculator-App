import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit() : super(InputState(input: "0"));

  // if number is equal zero (state will still be 0)
  void increment(input) {
    final chars = state.input;
    if (chars == "0" && input == "0") {
      // emit(InputState(input: "0"));
    } else if (input == "C") {
      emit(InputState(input: "0"));
    } else if (input == "Del" && chars.isNotEmpty) {
      final chars = state.input;
      emit(InputState(input: state.input.substring(0, chars.length - 1)));
    } else if (chars.startsWith("0") && input != "Del") {
      emit(InputState(input: input));
    } else if (!chars.startsWith("0") && input != "Del") {
      emit(InputState(input: chars + input));
    }
  }
}