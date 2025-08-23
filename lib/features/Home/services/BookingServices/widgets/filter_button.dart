import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flexana/core/theme/Colors.dart';

class FilterButton extends StatefulWidget {
  final String text;
  final String iconPath; // PNG path
  final VoidCallback? onTap;

  const FilterButton({
    super.key,
    required this.text,
    required this.iconPath,
    this.onTap,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isOpen = false;

  void _toggleOpen() {
    setState(() {
      isOpen = !isOpen;
    });
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _toggleOpen,
        child: Container(
          height: 25.h,

          margin: EdgeInsets.symmetric(horizontal: 3.w),
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// أيقونة PNG
              Image.asset(
                widget.iconPath,
                width: 14.w,
                height: 14.h,
                color: AppColors.primarycolor,
              ),

              SizedBox(width: 4.w),

              /// النص
              Flexible(
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style: barBookingTextStyle(),
                ),
              ),

              SizedBox(width: 3.w),

              /// السهم (يتغير حسب الحالة)
              Icon(
                isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 16.sp,
                color: AppColors.primarycolor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
