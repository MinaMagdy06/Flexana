import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetsData {
  static Image logo() {
    return Image.asset('assets/images/logo.png', width: 245.w, height: 168.h);
  }

  static Image CustomButtonn() {
    return Image.asset(
      'assets/images/customButton1.png',
      width: 157.w,
      height: 43.h,
    );
  }
}
