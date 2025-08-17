import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String icon;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 250.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5.w),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF214A50),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
            padding: EdgeInsets.all(7.w),
            child: Image.asset(icon),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: TextFormField(
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: formTextStyle(),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
