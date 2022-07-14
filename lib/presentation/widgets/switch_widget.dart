import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/core/exports.dart';
import 'package:calculator_app/logic/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Switcher extends StatefulWidget {
  const Switcher({Key key}) : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<ThemeCubit, bool>(
      listener: (context, state) {
        if(state){
          
        }
      },
      builder: (context, state) {
        return Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {
              // toggle theme
              BlocProvider.of<ThemeCubit>(context).toggleTheme(!state);
            },
            child: Container(
              height: 75,
              width: 40,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: theme.accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: AnimatedAlign(
                alignment: state ? Alignment.bottomCenter : Alignment.topCenter,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: _isDark ? blueGreyColor : primaryColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    _isDark ? Icons.dark_mode_sharp : Icons.light_mode_sharp,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
