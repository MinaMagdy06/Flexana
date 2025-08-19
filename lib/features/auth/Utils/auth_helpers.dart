import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexana/features/auth/auth_service.dart';
import 'package:flexana/features/auth/presentation/screens/Otp1_screen.dart';

bool validateFields({
  required BuildContext context,
  required TextEditingController firstNameController,
  required TextEditingController lastNameController,
  required TextEditingController phoneController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  if (firstNameController.text.trim().isEmpty ||
      lastNameController.text.trim().isEmpty ||
      phoneController.text.trim().isEmpty ||
      emailController.text.trim().isEmpty ||
      passwordController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in all fields ❗")),
    );
    return false;
  }

  if (phoneController.text.trim().length != 11) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Phone number must be 11 digits")),
    );
    return false;
  }

  return true;
}

Future<void> handleSignUp({
  required BuildContext context,
  required TextEditingController firstNameController,
  required TextEditingController lastNameController,
  required TextEditingController phoneController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) async {
  final authService = AuthService();

  final error = await authService.signUp(
    firstName: firstNameController.text.trim(),
    lastName: lastNameController.text.trim(),
    phone: phoneController.text.trim(),
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );

  if (error != null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    return;
  }

  await sendOtp(context: context, phone: phoneController.text.trim());
}

Future<void> sendOtp({
  required BuildContext context,
  required String phone,
}) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+20$phone',
    verificationCompleted: (PhoneAuthCredential credential) async {
      try {
        await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone verified automatically ✅")),
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Auto-verification error: $e")));
      }
    },
    verificationFailed: (FirebaseAuthException e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Verification failed: ${e.message}")),
      );
    },
    codeSent: (String verificationId, int? resendToken) {
      Navigator.push(
        context,
        SlideRightRoute(page: Otp1Screen(verificationId: verificationId)),
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}
