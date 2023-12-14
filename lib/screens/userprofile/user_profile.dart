import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/user_provider.dart';
import 'package:yogzen/screens/welcome/welcome_screen.dart';
import 'package:yogzen/services/auth_services.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        actions: [
          IconButton(
            onPressed: () {
              AuthServices().clearSharedPrefs();
              Navigator.pushNamedAndRemoveUntil(
                  context, WelcomeScreen.routeName, (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: klightBlue,
      body: Center(
        child: Text("User Profile of ${user.name}"),
      ),
    );
  }
}
