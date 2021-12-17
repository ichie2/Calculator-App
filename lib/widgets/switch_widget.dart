import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

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
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDark = !_isDark;
        });
      },
      child: Container(
        height: 75.h,
        width: 40.w,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          color: theme.accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: AnimatedAlign(
          alignment: _isDark ? Alignment.bottomCenter : Alignment.topCenter,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: _isDark ? Colors.blueGrey : theme.primaryColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              _isDark ? Icons.dark_mode_sharp : Icons.light_mode_sharp,
              size: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
