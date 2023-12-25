import 'package:flutter/material.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/screens/welcome/welcome_screen.dart';
import 'package:yogzen/services/auth_services.dart';

class UserProfileButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  UserProfileButtons({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('Edit Profile'),
              onTap: onPressed,
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: onPressed,
            ),
            ListTile(
              title: Text('Privacy Settings'),
              onTap: onPressed,
            ),
            ListTile(
              title: Text('Contact us'),
              onTap: onPressed,
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                AuthServices().clearSharedPrefs();
                Navigator.pushNamedAndRemoveUntil(
                    context, WelcomeScreen.routeName, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
