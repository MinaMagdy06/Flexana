import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        // 👈 هنا مختلف
        backgroundColor: Colors.teal,
        title: Text("Booking"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: Text("Booking Page for ${widget.currentUser.firstName}"),
      ),
    );
  }
}
