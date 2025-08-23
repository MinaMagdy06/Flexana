import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/Home/presentation/widgets/button_nav_bar.dart';
import 'package:flexana/features/auth/auth_service.dart';
import 'package:flexana/features/auth/presentation/screens/forget_pass_screen.dart';
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
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => isLoading = true);

    String? result = await _authService.login(
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() => isLoading = false);

    if (result == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login Successful ✅")));

      // هات اليوزر الحالي
      final currentUser = await _authService.getCurrentUser();

      if (currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          SlideRightRoute(page: BottomNavScreen(currentUser: currentUser)),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("User data not found ")));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
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
                  controller: phoneController,
                  hintText: 'Phone Number',
                  icon: 'assets/Icons/profile_icon.png',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: 'assets/Icons/password_icon.png',
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.07),

            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.scondcolor,
                    ),
                  )
                : CustomImageButton(title: 'Login', onTap: _login),

            SizedBox(height: screenHeight * 0.008),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SlideRightRoute(page: const ForgetPassScreen()),
                );
              },
              child: Text("forgot password", style: normalTextStyle()),
            ),

            SizedBox(height: screenHeight * 0.06),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomSwitch(),
                    Text("Remember me", style: normalTextStyle()),
                  ],
                ),
                SizedBox(width: screenWidth * 0.04),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(page: const SignupScreen()),
                    );
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
