import 'package:flexana/core/theme/Textstyle.dart';
import 'package:flexana/core/utils/assets_data.dart';
import 'package:flexana/core/widgets/custom_app_bar.dart';
import 'package:flexana/features/Home/presentation/widgets/terms_condayions.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagesScreen extends StatefulWidget {
  final AppUser currentUser;

  const PackagesScreen({super.key, required this.currentUser});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: CustomAppBar(
          currentUser: widget.currentUser,
          title: "Our Packages",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              AssetsData.yogaPackages(context),
              Text('Yoga and Mat Pilates Packages', style: packagesTextStyle()),
              SizedBox(height: 10.h),
              AssetsData.ReformPackages(context),
              Text('Reform Pilates Packages', style: packagesTextStyle()),
              SizedBox(height: 45.h),
              TermsCondayions(),
            ],
          ),
        ),
      ),
    );
  }
}
