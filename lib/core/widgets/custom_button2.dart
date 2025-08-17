import 'package:flexana/core/utils/assets_data.dart';
import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flexana/core/theme/Textstyle.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key, required this.title, this.onTap});
  final String title;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AssetsData.customButton2(context),

          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(title, style: ButtonStyle()),
          ),
        ],
      ),
    );
  }
}
