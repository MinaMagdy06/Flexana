import 'package:flexana/core/theme/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8.w,
      child: Switch(
        value: true,
        onChanged: (v) {},
        activeColor: AppColors.primarycolor,
        activeTrackColor: Colors.white,
        inactiveThumbColor: AppColors.primarycolor,
        inactiveTrackColor: Colors.white,
      ),
    );
  }
}
