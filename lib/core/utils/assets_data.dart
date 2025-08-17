import 'package:flutter/widgets.dart';

class AssetsData {
  static Image logo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image.asset(
      'assets/images/logo.png',
      width: screenWidth * 0.65, // 245.w تقريبًا
      height: screenHeight * 0.20, // 168.h تقريبًا
    );
  }

  static Image customButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image.asset(
      'assets/images/customButton1.png',
      width: screenWidth * 0.42, // 157.w تقريبًا
      height: screenHeight * 0.055, // 43.h تقريبًا
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
}
