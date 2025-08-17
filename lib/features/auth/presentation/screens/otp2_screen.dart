import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/change_pass_screen.dart';
import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otp2Screen extends StatefulWidget {
  const Otp2Screen({super.key});

  @override
  State<Otp2Screen> createState() => _Otp2ScreenState();
}

class _Otp2ScreenState extends State<Otp2Screen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.Primarycolor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
        child: ListView(
          children: [
            SizedBox(height: 175.h),
            AssetsData.logo(context),
            SizedBox(height: 95.h),
            Column(
              children: [
                CustomTextFormField(
                  hintText: 'Enter OTP Code',
                  icon: 'assets/Icons/Otp_icon.png',
                ),
              ],
            ),
            SizedBox(height: 70.h),
            CustomImageButton(
              title: 'Confirm',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  SlideRightRoute(page: ChangePassScreen()),
                  (route) => false,
                );
              },
            ),
            CustomImageButton(title: 'Send again', onTap: () {}),
            Center(child: Text('Or', style: normalTextStyle())),

            CustomImageButton(
              title: 'Cancel',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
