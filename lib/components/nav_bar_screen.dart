import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:yogzen/components/nav_bar.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/screens/home/home_screen.dart';
import 'package:yogzen/screens/specific_needs/specific_needs.dart';
import 'package:yogzen/screens/userprofile/user_profile.dart';

class NavScreen extends StatefulWidget {
  static const routeName = "/tabScreen";
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final _pages = [
    HomeScreen(),
    SpecificNeedsScreen(),
    UserProfileScreen(),
  ];

  var _selected = 0;

  void _changeScreen(val) {
    setState(() {
      _selected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selected],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: BottomNavyBar(
          backgroundColor: Colors.white,
          showElevation: false,
          items: [
            BottomNavyBarItem(
              title: Text(
                "Home",
                style: TextStyle(
                  color: kblackHeading,
                ),
              ),
              icon: SizedBox(
                child: Icon(
                  Icons.home,
                  color: kblackHeading,
                ),
              ),
            ),
            BottomNavyBarItem(
              title: Text(
                "Health",
                style: TextStyle(
                  color: kblackHeading,
                ),
              ),
              icon: SizedBox(
                child: Icon(
                  Icons.health_and_safety,
                  color: kblackHeading,
                ),
              ),
            ),
            BottomNavyBarItem(
              title: Text(
                "Profile",
                style: TextStyle(
                  color: kblackHeading,
                ),
              ),
              icon: SizedBox(
                child: Icon(
                  Icons.person,
                  color: kblackHeading,
                ),
              ),
            ),
          ],
          selectedIndex: _selected,
          onItemSelected: _changeScreen,
        ),
      ),
    );
  }
}
