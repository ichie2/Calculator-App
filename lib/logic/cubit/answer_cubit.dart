import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';
part 'answer_state.dart';

class AnswerCubit extends Cubit<AnswerState> {
  AnswerCubit() : super(AnswerState(answer: ""));

  void evalute(input) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(input);
      ContextModel contextModel = ContextModel();
      final res = exp.evaluate(EvaluationType.REAL, contextModel);
      emit(AnswerState(answer: res.toString()));
    } catch (e) {
      emit(AnswerState(answer: "$e"));
    }
  }

  void clear() {
    emit(AnswerState(answer: ""));
  }
}
