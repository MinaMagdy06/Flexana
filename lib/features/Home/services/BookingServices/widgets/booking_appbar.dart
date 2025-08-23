import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/features/Home/services/BookingServices/widgets/filter_button.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingAppbar extends StatelessWidget implements PreferredSizeWidget {
  final AppUser currentUser;
  final String title;

  const BookingAppbar({
    super.key,
    required this.currentUser,
    required this.title,
  });

  /// خلي الـ preferredSize دايمًا مساوي أو أكبر من محتوى الـ AppBar
  @override
  Size get preferredSize => Size.fromHeight(160.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primarycolor,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 160.h,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AssetsData.AppbarLogo(context),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 23.r,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Hello ${currentUser.firstName}!',
                            style: barIconStyle().copyWith(fontSize: 11.sp),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterButton(
                        text: 'Select Date',
                        iconPath: 'assets/Icons/selectDate_icon.png',
                      ),
                      FilterButton(
                        text: 'Yoga Type',
                        iconPath: 'assets/Icons/yogaType_icon.png',
                      ),
                      FilterButton(
                        text: 'Instructor',
                        iconPath: 'assets/Icons/instructor_icon.png',
                      ),
                      FilterButton(
                        text: 'Level',
                        iconPath: 'assets/Icons/level_icon.png',
                      ),
                    ],
                  ),
                ],
              ),

              Positioned(
                top: 55.h,
                child: Text(title, style: barTextStyle()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
