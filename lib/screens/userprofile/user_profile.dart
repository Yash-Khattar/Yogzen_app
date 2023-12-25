import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/user_provider.dart';
import 'package:yogzen/screens/userprofile/userProfileButtons.dart';

import '../../components/chat_button.dart';
import '../chatbot.dart/chatbot.dart';
import '../chatbot.dart/components/bottome_page.dart';

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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: const ChatButton(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kdarkBlue,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: klightBlue,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Center(
              child: RippleAnimation(
                color: kdarkBlue,
                // delay: const Duration(milliseconds: 300),
                repeat: true,
                // minRadius: 60,
                // ripplesCount: 6,
                // duration: const Duration(milliseconds: 6 * 300),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/UserImage.jpeg'),
                  radius: height * 0.1,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              child: Text(
                '${user.name}',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                '${user.email}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: UserProfileButtons(title: '', onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
