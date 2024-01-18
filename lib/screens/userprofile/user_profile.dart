import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/user_provider.dart';
import 'package:yogzen/screens/userprofile/userProfileButtons.dart';

import '../../components/chat_button.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: const ChatButton(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kdarkBlue,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: klightBlue,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Center(
              child: RippleAnimation(
                color: kdarkBlue,
                
                repeat: true,
                
                child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/UserImage.jpeg'),
                  radius: height * 0.1,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              child: Text(
                '${user.name}',
                style: const TextStyle(
                  
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                '${user.email}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: UserProfileButtons(title: '', onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
