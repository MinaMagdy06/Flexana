import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final AppUser currentUser;
  final String title;

  const CustomAppBar({
    super.key,
    required this.currentUser,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      decoration: BoxDecoration(color: AppColors.primarycolor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 17.0),
                  child: Row(
                    children: [
                      AssetsData.AppbarLogo(context),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 23,
                            backgroundColor: Colors.white,
                          ),
                          Text(
                            'Hello ${currentUser.firstName}!',
                            style: barIconStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(title, style: barTextStyle()), // 👈 ده اللي هيتغير
          ],
        ),
      ),
    );
  }
}
