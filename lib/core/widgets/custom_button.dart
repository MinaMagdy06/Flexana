import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageButton extends StatelessWidget {
  final String title;

  final VoidCallback? onTap;

  const CustomImageButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AssetsData.customButton(context),

          Padding(
            padding: EdgeInsets.only(bottom: 9.h),
            child: Text(title, style: ButtonStyle()),
          ),
        ],
      ),
    );
  }
}
