import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/widgets/custom_slide_inemation.dart';
import 'package:flexana/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, -1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, SlideRightRoute(page: LoginScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.Primarycolor,
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Image.asset(
            "assets/images/logo.png",
            width: screenWidth * 0.65,
            height: screenHeight * 0.20,
          ),
        ),
      ),
    );
  }
}
