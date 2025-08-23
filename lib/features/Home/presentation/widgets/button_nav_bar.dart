import 'package:flexana/core/theme/Colors.dart';
import 'package:flexana/core/theme/FontsFamily.dart';
import 'package:flexana/features/Home/presentation/screens/booking_screen.dart';
import 'package:flexana/features/Home/presentation/screens/location_screen.dart';
import 'package:flexana/features/Home/presentation/screens/packges_screen.dart';
import 'package:flexana/features/Home/presentation/screens/profile_screen.dart';
import 'package:flexana/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  final AppUser currentUser;

  const BottomNavScreen({super.key, required this.currentUser});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      LocationScreen(currentUser: widget.currentUser),
      BookingScreen(currentUser: widget.currentUser),
      PackagesScreen(currentUser: widget.currentUser),
      ProfileScreen(currentUser: widget.currentUser),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.scondcolor,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.primarycolor,
        selectedLabelStyle: TextStyle(fontFamily: Fontsfamily.fonttextfamily),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/Icons/locations_icon.png'),
              color: _currentIndex == 0 ? AppColors.scondcolor : Colors.white,
            ),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/Icons/Booking_icon.png'),
              color: _currentIndex == 1 ? AppColors.scondcolor : Colors.white,
            ),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/Icons/Backages_Icon.png'),
              color: _currentIndex == 2 ? AppColors.scondcolor : Colors.white,
            ),
            label: "Packages",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/Icons/profile_icon.png'),
              color: _currentIndex == 3 ? AppColors.scondcolor : Colors.white,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
