import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/FontsFamily.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle formTextStyle({double? fontSize}) {
  return TextStyle(
    fontFamily: Fontsfamily.fontformfamily,
    fontSize: (fontSize ?? 18.sp),
    color: AppColors.graycolor,
  );
}

TextStyle ButtonStyle({double? fontSize}) {
  return TextStyle(
    fontFamily: Fontsfamily.fontformfamily,
    fontSize: (fontSize ?? 18.sp),
    color: Colors.white,
  );
}

TextStyle normalTextStyle({double? fontSize, Color color = Colors.white}) {
  return TextStyle(
    fontFamily: Fontsfamily.fonttextfamily,
    fontSize: (fontSize ?? 17.sp),
    color: color,
  );
}

TextStyle barIconStyle({double? fontSize, Color color = Colors.white}) {
  return TextStyle(
    fontFamily: Fontsfamily.fonttextfamily,
    fontSize: (fontSize ?? 12.sp),
    color: color,
  );
}

TextStyle barTextStyle({double? fontSize, Color color = Colors.white}) {
  return TextStyle(
    fontFamily: Fontsfamily.fonttextfamily,
    fontSize: (fontSize ?? 17.sp),
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle barBookingStyle({double? fontSize, Color color = Colors.white}) {
  return TextStyle(
    fontFamily: Fontsfamily.fonttextfamily,
    fontSize: (fontSize ?? 15.sp),
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle barBookingTextStyle({double? fontSize, Color color = Colors.white}) {
  return TextStyle(
    fontFamily: Fontsfamily.fonttextfamily,
    fontSize: (fontSize ?? 9.sp),
    fontWeight: FontWeight.bold,
    color: AppColors.primarycolor,
  );
}

TextStyle classBookingTextStyle({
  double? fontSize,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontFamily: Fontsfamily.fonttextfamily,
    fontSize: (fontSize ?? 14.sp),
    fontWeight: FontWeight.w800,
    color: color,
  );
}
