import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/features/auth/presentation/screens/signup_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_Switch.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.Primarycolor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035), // ~13.w
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.15), // ~120.h
            AssetsData.logo(context),
            SizedBox(height: screenHeight * 0.14), // ~110.h
            Column(
              children: [
                CustomTextFormField(
                  hintText: 'Phone Number',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025), // ~20.h

                CustomTextFormField(
                  hintText: 'Password',
                  icon: 'assets/Icons/password_icon.png',
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.07), // ~55.h

            CustomImageButton(title: 'Login'),
            SizedBox(height: screenHeight * 0.008), // ~10.h

            TextButton(
              onPressed: () {},
              child: Text("forgot password", style: normalTextStyle()),
            ),

            SizedBox(height: screenHeight * 0.06), // ~70.h

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomSwitch(),
                    Text("Remember me", style: normalTextStyle()),
                  ],
                ),
                SizedBox(width: screenWidth * 0.04), // ~14.w
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: Text("Create Account", style: normalTextStyle()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
