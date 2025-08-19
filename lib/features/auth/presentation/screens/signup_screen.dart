import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/features/auth/Utils/auth_helpers.dart';
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

  bool isLoading = false; // ✅ عشان نتحكم في حالة الـ Loading

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // المستخدم ما يقفلش الـ dialog
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.Scondcolor),
        );
      },
    );
  }

  void _hideLoadingDialog() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // يقفل الـ dialog
    }
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
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
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
                final isValid = validateFields(
                  context: context,
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  phoneController: _phoneController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                );

                if (!isValid) return;

                // ✅ عرض اللودنج
                _showLoadingDialog();

                await handleSignUp(
                  context: context,
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  phoneController: _phoneController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                );

                // ✅ إخفاء اللودنج
                _hideLoadingDialog();
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
