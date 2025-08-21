import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button2.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassScreen extends StatefulWidget {
  final String phone;

  const ChangePassScreen({super.key, required this.phone});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  Future<void> _changePassword() async {
    String newPass = _newPassController.text.trim();
    String confirmPass = _confirmPassController.text.trim();

    if (newPass.isEmpty || confirmPass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    if (newPass != confirmPass) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.reload();
        user = FirebaseAuth.instance.currentUser;

        await user!.updatePassword(newPass);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password changed successfully ✅")),
        );

        Navigator.pushAndRemoveUntil(
          context,
          SlideRightRoute(page: const LoginScreen()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("No user logged in")));
      }
    } catch (e) {
      String errorMsg = "Error: ${e.toString()}";

      if (e.toString().contains("requires-recent-login")) {
        errorMsg = "Session expired. Please login again.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMsg)));
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
                  controller: _newPassController,
                  hintText: 'New Password',
                  icon: 'assets/Icons/profile_icon.png',
                ),
                SizedBox(height: screenHeight * 0.025),
                CustomTextFormField(
                  controller: _confirmPassController,
                  hintText: 'Confirm Password',
                  icon: 'assets/Icons/password_icon.png',
                ),
              ],
            ),
            SizedBox(height: 65.h),
            CustomButton2(title: 'Change Password', onTap: _changePassword),
          ],
        ),
      ),
    );
  }
}
