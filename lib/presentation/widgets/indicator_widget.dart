import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/core/exports.dart';

Container indicator() {
  return Container(
    height: 6.h,
    width: 50.w,
    decoration: BoxDecoration(
      color: greyTextColor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10.sp),
    ),
  );
}
