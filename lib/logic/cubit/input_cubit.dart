import 'package:bloc/bloc.dart';
import 'package:calculator_app/logic/cubit/answer_cubit.dart';
import 'package:calculator_app/presentation/widgets/toast_widget.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  final AnswerCubit answerCubit;

  stt.SpeechToText _speech;

  InputCubit(this.answerCubit) : super(InputState(input: "0")) {
    _speech = stt.SpeechToText();
  }

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

  void listen() async {
    bool _isListening = false;
    bool _availability;

    if (!_isListening) {
      _availability = await _speech.initialize(
        onError: (err) {
          showToast(message: err.errorMsg);
        },
        onStatus: (status) {
          showToast(message: status);
        },
      );

      if (_availability) {
        _isListening = true;
        _speech.listen(
          onResult: (res) {
            print("recognized ${res.recognizedWords}");
            final result = res.recognizedWords;
            emit(InputState(input: result));
          },
        );
      } else {
        _speech.stop();
      }
    }
    print(_availability);
  }

  void stop() {
    _speech.stop();
  }
}
