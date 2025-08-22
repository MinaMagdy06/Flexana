import 'package:flexana/core/widgets/custom_app_bar.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: CustomAppBar(
          currentUser: widget.currentUser,
          title: "My Packages",
        ),
      ),
      body: Center(
        child: Text("My Packages for ${widget.currentUser.firstName}"),
      ),
    );
  }
}
