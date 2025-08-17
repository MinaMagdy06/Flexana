import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/Otp1_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});
  static String id = "otp_login_screen";
  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreen();
}

class _ForgetPassScreen extends State<ForgetPassScreen> {
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
            SizedBox(height: 175..h),
            AssetsData.logo(context),
            SizedBox(height: 95.h),
            Column(
              children: [
                CustomTextFormField(
                  hintText: 'Phone Number',
                  icon: 'assets/Icons/Phonee_icon.png',
                ),
              ],
            ),

            SizedBox(height: 75.h),
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
