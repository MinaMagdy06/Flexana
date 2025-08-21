import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/features/location/presentation/Screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({super.key, required this.widget});

  final LocationScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135..h,
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
                            'Hello ${widget.user.firstName}!',
                            style: barIconStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Text("Our Branches & Shop", style: barTextStyle()),
          ],
        ),
      ),
    );
  }
}
