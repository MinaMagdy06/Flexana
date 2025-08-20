import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/change_pass_screen.dart';
import 'package:flexana/features/auth/presentation/widgets/Custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Otp2Screen extends StatefulWidget {
  final String verificationId;
  final String phone;

  const Otp2Screen({
    super.key,
    required this.verificationId,
    required this.phone,
  });

  @override
  State<Otp2Screen> createState() => _Otp2ScreenState();
}

class _Otp2ScreenState extends State<Otp2Screen> {
  final TextEditingController _otpController = TextEditingController();
  bool _loading = false;

  Future<void> _verifyOtp() async {
    final smsCode = _otpController.text.trim();

    if (smsCode.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter the OTP code")));
      return;
    }

    setState(() => _loading = true);

    try {
      // عمل credential من الكود
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );

      // تسجيل دخول مؤقت للتحقق
      await FirebaseAuth.instance.signInWithCredential(credential);

      setState(() => _loading = false);

      // نجاح → يروح لتغيير الباسورد
      Navigator.pushAndRemoveUntil(
        context,
        SlideRightRoute(page: ChangePassScreen(phone: widget.phone)),
        (route) => false,
      );
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid OTP, please try again")));
    }
  }

  void _resendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phone,
      verificationCompleted: (_) {},
      verificationFailed: (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${e.message}")));
      },
      codeSent: (verificationId, resendToken) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("OTP sent again")));
        setState(() {
          // تحديث الـ verificationId عشان الكود الجديد
          widget.verificationId == verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.Primarycolor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
        child: ListView(
          children: [
            SizedBox(height: 175.h),
            AssetsData.logo(context),
            SizedBox(height: 95.h),

            Column(
              children: [
                CustomTextFormField(
                  controller: _otpController,
                  hintText: 'Enter OTP Code',
                  icon: 'assets/Icons/Otp_icon.png',
                  keyboardType: TextInputType.number,
                ),
              ],
            ),

            SizedBox(height: 70.h),

            CustomImageButton(
              title: _loading ? "Verifying..." : 'Confirm',
              onTap: _loading ? null : _verifyOtp,
            ),

            CustomImageButton(title: 'Send again', onTap: _resendOtp),

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
