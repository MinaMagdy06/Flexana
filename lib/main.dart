import 'package:flexana/features/auth/presentation/screens/Otp1_screen.dart';
import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flexana/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Flexana());
}

class Flexana extends StatelessWidget {
  const Flexana({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          Otp1Screen.id: (context) => Otp1Screen(),
        },
        initialRoute: LoginScreen.id,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
