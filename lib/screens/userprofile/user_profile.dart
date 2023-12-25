import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/user_provider.dart';
import 'package:yogzen/screens/userprofile/userProfileButtons.dart';

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
    return Stack(
      children: [Scaffold(
        appBar: AppBar(
          backgroundColor: kdarkBlue,
          title: Text("Profile"),
        ),
        backgroundColor: klightBlue,
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Column(
            children: [
              SizedBox(height: height * 0.015),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/UserImage.jpeg'),
                  radius: height * 0.1,
                ),
              ),
              SizedBox(height: 10,),
      
              Container(
                child: Text(
                  '${user.name}',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 5,),
      
              Container(
                child: Text(
                  '${user.email}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            //SizedBox(height: 10,),

            UserProfileButtons(title: '', onPressed: () {}),
      
            ],
          ),
          )
      ),
    ] );
  }
}
