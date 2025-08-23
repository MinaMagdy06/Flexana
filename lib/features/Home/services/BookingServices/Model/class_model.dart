import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassItem {
  final String time;
  final String duration;
  final String title;
  final String instructor;
  final String type; // ladies only, mixed

  ClassItem({
    required this.time,
    required this.duration,
    required this.title,
    required this.instructor,
    required this.type,
  });
}

class ClassesList extends StatelessWidget {
  final List<ClassItem> classes;

  const ClassesList({super.key, required this.classes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.w),
      itemCount: classes.length,
      separatorBuilder: (_, __) => Divider(thickness: 1.h),
      itemBuilder: (context, index) {
        final item = classes[index];

        return Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time + Duration
              SizedBox(
                width: 70.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.time, style: classBookingTextStyle()),
                    Text(item.duration, style: classBookingTextStyle()),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              // Title + Instructor
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: classBookingTextStyle()),
                    Text(item.instructor, style: classBookingTextStyle()),
                  ],
                ),
              ),
              // Badge
              Container(
                width: 95.w,
                height: 30.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    item.type,
                    style: classBookingTextStyle(),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
