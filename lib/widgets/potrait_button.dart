import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class ButtonWidget extends StatelessWidget {
  final String character;

  const ButtonWidget({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        //
        print(context);
      },
      borderRadius: BorderRadius.circular(10.sp),
      child: Padding(
        padding: character == "="
            ? EdgeInsets.symmetric(horizontal: 10.w)
            : EdgeInsets.only(),
        child: Container(
          height: character == "=" ? 60.h : 40.h,
          width: character == "=" ? 30.h : 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: character == "=" ? theme.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Text(
            character,
            style: theme.textTheme.bodyText2.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

Container indicatorWidget(ThemeData theme) {
  return Container(
    height: 6.h,
    width: 50.w,
    decoration: BoxDecoration(
      color: theme.accentColor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10.sp),
    ),
  );
}
