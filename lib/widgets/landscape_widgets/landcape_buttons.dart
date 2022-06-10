// landcape number pads
import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/logic/cubit/input_cubit.dart';
import 'package:calculator_app/utils/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryLandscapeButton extends StatelessWidget {
  final String character;

  const PrimaryLandscapeButton({
    Key key,
    this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = context.read<InputCubit>();
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Container(
        decoration: BoxDecoration(
          color: character == " = " ? theme.primaryColor : transparentColor,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              //
              con.increment(character);
            },
            borderRadius: BorderRadius.circular(20.sp),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Center(
                child: Text(
                  character,
                  style: theme.textTheme.bodyText2.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color:
                        character == "=" ? theme.backgroundColor : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// landscape number pads
class LandscapeButton extends StatelessWidget {
  final String character;

  const LandscapeButton({Key key, this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final con = context.read<InputCubit>();
    final theme = Theme.of(context);
    return Container(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            //
            con.increment(character);
          },
          borderRadius: BorderRadius.circular(20.sp),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Center(
              child: Text(
                character,
                style: theme.textTheme.bodyText2.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
