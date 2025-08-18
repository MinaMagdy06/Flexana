import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/auth_service.dart';
import 'package:flexana/features/auth/presentation/screens/Otp1_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static String id = "signup_screen";

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  controller: _firstNameController,
                  hintText: 'First name',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  controller: _lastNameController,
                  hintText: 'Last name',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  controller: _phoneController,
                  hintText: 'Phone number',
                  icon: 'assets/Icons/Phonee_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  icon: 'assets/Icons/Email_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: 'Password',
                  icon: 'assets/Icons/password_icon.png',
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.05),

            CustomImageButton(
              title: 'Confirm',
              onTap: () async {
                final authService = AuthService();

                final error = await authService.signUp(
                  firstName: _firstNameController.text.trim(),
                  lastName: _lastNameController.text.trim(),
                  phone: _phoneController.text.trim(),
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                );

                if (error == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Signup Success ✅, check your email"),
                    ),
                  );

                  Navigator.push(context, SlideRightRoute(page: Otp1Screen()));
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(error)));
                }
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
