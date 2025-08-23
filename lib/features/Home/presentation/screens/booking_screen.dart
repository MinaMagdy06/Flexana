import 'package:flexana/features/Home/services/BookingServices/Model/class_model.dart';
import 'package:flexana/features/Home/services/BookingServices/Model/data_model.dart';
import 'package:flexana/features/Home/services/BookingServices/widgets/booking_appbar.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends StatefulWidget {
  final AppUser currentUser;

  const BookingScreen({super.key, required this.currentUser});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(111),
        child: BookingAppbar(
          currentUser: widget.currentUser,
          title: "SUN 16 FEB",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: ClassesList(classes: classes),
      ),
    );
  }
}
