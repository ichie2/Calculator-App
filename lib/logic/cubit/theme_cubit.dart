import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc/bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(false);

  void toggleTheme(bool value) {
    emit(value);
  }

  @override
  bool fromJson(Map<String, dynamic> json) {
    return json["theme"];
  }

  @override
  Map<String, dynamic> toJson(bool state) {
    return {
      "theme": state,
    };
  }
}
