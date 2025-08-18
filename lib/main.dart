import 'package:firebase_core/firebase_core.dart';
import 'package:flexana/core/theme/splash_screen.dart';
import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flexana/features/auth/presentation/screens/forget_pass_screen.dart';
import 'package:flexana/features/auth/presentation/screens/signup_screen.dart';
import 'package:flexana/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          ForgetPassScreen.id: (context) => ForgetPassScreen(),
        },
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
