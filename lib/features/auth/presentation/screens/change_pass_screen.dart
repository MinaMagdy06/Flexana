import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button2.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/forget_pass_screen.dart';
import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreen();
}

class _ChangePassScreen extends State<ChangePassScreen> {
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
            SizedBox(height: screenHeight * 0.15),
            AssetsData.logo(context),
            SizedBox(height: screenHeight * 0.14),
            Column(
              children: [
                CustomTextFormField(
                  hintText: 'New Password',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),

                CustomTextFormField(
                  hintText: 'Confirm Password',
                  icon: 'assets/Icons/password_icon.png',
                ),
              ],
            ),

            SizedBox(height: 65.h),
            CustomButton2(
              title: 'Change Password',
              onTap: () {
                Navigator.push(context, SlideRightRoute(page: LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
