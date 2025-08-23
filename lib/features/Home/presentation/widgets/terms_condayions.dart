import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/FontsFamily.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsCondayions extends StatelessWidget {
  const TermsCondayions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terms & conditions',
          style: TextStyle(
            fontFamily: Fontsfamily.fonttextfamily,
            color: AppColors.primarycolor,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Packages are non refundable and non shareable .',
          style: TextStyle(
            fontFamily: Fontsfamily.fonttextfamily,
            color: AppColors.primarycolor,
            fontWeight: FontWeight.w300,
            fontSize: 9.sp,
          ),
        ),
        Text(
          'Using sauna & jacuzzi is free but required prebooking (Ladies Only ) .',
          style: TextStyle(
            fontFamily: Fontsfamily.fonttextfamily,
            color: AppColors.primarycolor,
            fontWeight: FontWeight.w300,
            fontSize: 9.sp,
          ),
        ),
        Text(
          'But you have to attend a class if you have one of the“with no expiry data“ packages .',
          style: TextStyle(
            fontFamily: Fontsfamily.fonttextfamily,
            color: AppColors.primarycolor,
            fontWeight: FontWeight.w300,
            fontSize: 9.sp,
          ),
        ),
        Text(
          'No freezing available in packages with expiry data .',
          style: TextStyle(
            fontFamily: Fontsfamily.fonttextfamily,
            color: AppColors.primarycolor,
            fontWeight: FontWeight.w300,
            fontSize: 9.sp,
          ),
        ),
      ],
    );
  }
}
