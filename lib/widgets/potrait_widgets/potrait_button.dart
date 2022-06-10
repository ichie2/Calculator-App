import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/logic/cubit/input_cubit.dart';
import 'package:calculator_app/utils/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWidget extends StatelessWidget {
  final String character;

  const ButtonWidget({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = context.read<InputCubit>();
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: character == "="
          ? EdgeInsets.symmetric(horizontal: 10.w)
          : EdgeInsets.only(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: character == "=" ? primaryColor : transparentColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              //
              con.increment(character);
            },
            borderRadius: BorderRadius.circular(10.sp),
            child: Padding(
              padding: character == "="
                  ? EdgeInsets.all(25.w)
                  : EdgeInsets.all(22.w),
              child: Text(
                character,
                style: textTheme.bodyText2.copyWith(
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
