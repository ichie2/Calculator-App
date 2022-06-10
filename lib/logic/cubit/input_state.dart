part of 'input_cubit.dart';

// @immutable
// abstract class InputState {}

class InputState {
  String input;
  bool includeChars;

  InputState({
    @required this.input,
    this.includeChars,
  });
}
