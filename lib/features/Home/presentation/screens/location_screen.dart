import 'package:flexana/core/widgets/custom_app_bar.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final AppUser currentUser;

  const LocationScreen({super.key, required this.currentUser});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(135),
        child: CustomAppBar(
          currentUser: widget.currentUser,
          title: "Our Branches & Shop",
        ),
      ),
      body: Center(
        child: Text("Welcome to Location, ${widget.currentUser.firstName}"),
      ),
    );
  }
}
