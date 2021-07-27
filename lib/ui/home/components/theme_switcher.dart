import 'package:calculator_app/models/theme_model.dart';
import 'package:calculator_app/widgets/theme_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    return Container(
      height: 45.h,
      width: 105.w,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 20.w,
              children: List.generate(allIcons.length, (int index) {
                return ThemeIcon(
                  icon: allIcons[index].icon,
                  onPressed: () {
                    selectedIndex = index;
                    setState(() {});
                    print(selectedIndex);
                  },
                  color: selectedIndex == index ? Colors.grey : Colors.black,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

/* Icon(),
                Icon(), 
                */
