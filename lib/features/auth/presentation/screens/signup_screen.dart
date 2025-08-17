import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/Otp1_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static String id = "signup_screen";

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
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
            SizedBox(height: 70.h),
            AssetsData.logo(context),
            SizedBox(height: 70.h),
            Column(
              children: [
                CustomTextFormField(
                  hintText: 'First name',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  hintText: 'Last name',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  hintText: 'Phone number',
                  icon: 'assets/Icons/Phonee_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  hintText: 'Email Address',
                  icon: 'assets/Icons/Email_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  hintText: 'Password',
                  icon: 'assets/Icons/password_icon.png',
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.05),

            CustomImageButton(
              title: 'Confirm',
              onTap: () {
                Navigator.push(context, SlideRightRoute(page: Otp1Screen()));
              },
            ),

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
