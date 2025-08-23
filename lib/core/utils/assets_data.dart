import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AssetsData {
  static Image logo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image.asset(
      'assets/images/logo.png',
      width: screenWidth * 0.65,
      height: screenHeight * 0.20,
    );
  }

  static Image AppbarLogo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image.asset(
      'assets/images/logo.png',
      width: screenWidth * 0.20,
      height: screenHeight * 0.1,
    );
  }

  static Image customButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image.asset(
      'assets/images/customButton1.png',
      width: screenWidth * 0.42,
      height: screenHeight * 0.055,
    );
  }

  static Image customButton2(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image.asset(
      'assets/images/customButton2.png',
      width: screenWidth * 0.50,
      height: screenHeight * 0.060,
    );
  }

  static Widget yogaPackages(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SvgPicture.asset(
      'assets/Icons/Isolation Mode.svg',
      width: screenWidth * 0.45,
      height: screenHeight * 0.25,
    );
  }

  static Widget ReformPackages(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SvgPicture.asset(
      'assets/Icons/Frame.svg',
      width: screenWidth * 0.45,
      height: screenHeight * 0.25,
    );
  }
}
