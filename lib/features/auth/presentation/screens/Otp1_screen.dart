import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';

import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otp1Screen extends StatefulWidget {
  Otp1Screen({super.key, required this.verificationId});
  static String id = "otp1_screen";
  final String verificationId;

  @override
  State<Otp1Screen> createState() => _Otp1Screen();
}

class _Otp1Screen extends State<Otp1Screen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 175.h),
                AssetsData.logo(context),
                SizedBox(height: 95.h),
                CustomTextFormField(
                  controller: _otpController,
                  hintText: 'Enter OTP Code',
                  icon: 'assets/Icons/Otp_icon.png',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 75.h),
                CustomImageButton(
                  title: 'Sign up',
                  onTap: () async {
                    try {
                      final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: _otpController.text.trim(),
                      );

                      await FirebaseAuth.instance.currentUser
                          ?.linkWithCredential(credential);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Phone verified and linked ✅"),
                        ),
                      );

                      Navigator.pushAndRemoveUntil(
                        context,
                        SlideRightRoute(page: LoginScreen()),
                        (route) => false,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("OTP verification failed: $e")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
