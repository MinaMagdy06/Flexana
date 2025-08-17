import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otp1Screen extends StatefulWidget {
  const Otp1Screen({super.key});
  static String id = "otp1_screen";

  @override
  State<Otp1Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Otp1Screen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
            SizedBox(height: 75.h),
            CustomImageButton(
              title: 'Sign Up',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  SlideRightRoute(page: LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
