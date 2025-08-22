import 'package:flexana/core/widgets/custom_app_bar.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final AppUser currentUser;

  const ProfileScreen({super.key, required this.currentUser});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: CustomAppBar(currentUser: widget.currentUser, title: "Profile"),
      ),
      body: Center(child: Text("Profile of ${widget.currentUser.firstName}")),
    );
  }
}
