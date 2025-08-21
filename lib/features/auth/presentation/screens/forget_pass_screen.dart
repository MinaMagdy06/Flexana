import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_button.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/auth_service.dart';
import 'package:flexana/features/auth/presentation/screens/otp2_screen.dart';
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
  final TextEditingController _phoneController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _loading = false;

  void _sendOtp() async {
    final phone = _phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Please enter your phone number")),
      );
      return;
    }

    setState(() => _loading = true);

    final result = await _authService.sendOtp(
      phoneNumber: "+20$phone", // ✅ لازم تضيف كود الدولة
      codeSent: (verificationId) {
        setState(() => _loading = false);
        Navigator.push(
          context,
          SlideRightRoute(
            page: Otp2Screen(
              verificationId: verificationId,
              phone: "+20$phone",
            ),
          ),
        );
      },
    );

    setState(() => _loading = false);

    if (result != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
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
                  controller: _phoneController,
                  hintText: 'Phone Number',
                  icon: 'assets/Icons/Phonee_icon.png',
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),

            SizedBox(height: 75.h),
            CustomImageButton(
              title: _loading ? "Sending..." : 'Confirm',
              onTap: _loading ? null : _sendOtp,
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
