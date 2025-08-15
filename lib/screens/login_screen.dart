import 'package:flexana/const/Textstyle.dart';
import 'package:flexana/const/assets_data.dart';
import 'package:flexana/const/colors.dart';
import 'package:flexana/widgets/Custom_Switch.dart';
import 'package:flexana/widgets/Custom_textfield.dart';
import 'package:flexana/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Primarycolor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120.h),
                AssetsData.logo(),
                SizedBox(height: 110.h),
                CustomTextFormField(
                  hintText: 'Phone Number',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: 20.h),
                // Password
                CustomTextFormField(
                  hintText: 'Password',
                  icon: 'assets/Icons/password_icon.png',
                ),
                SizedBox(height: 55.h),

                CustomImageButton(title: 'Login'),
                SizedBox(height: 15.h),

                TextButton(
                  onPressed: () {},
                  child: Text("forgot password", style: normalTextStyle()),
                ),

                SizedBox(height: 70.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomSwitch(),

                        Text("Remember me", style: normalTextStyle()),
                      ],
                    ),
                    SizedBox(width: 14.w),
                    TextButton(
                      onPressed: () {},
                      child: Text("Create Account", style: normalTextStyle()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
