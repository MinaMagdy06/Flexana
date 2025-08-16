import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/FontsFamily.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle formTextStyle({double? fontSize}) {
  return TextStyle(
    fontFamily: Fontsfamily.fontformfamily,
    fontSize: (fontSize ?? 18.sp),
    color: AppColors.Graycolor,
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
