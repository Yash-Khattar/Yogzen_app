import 'package:flutter/material.dart';

import '../global/color.dart';
import '../screens/chatbot.dart/chatbot.dart';
import '../screens/chatbot.dart/components/bottome_page.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        BottomToTopPageRouteBuilder(
          page: ChatScreen(),
        ),
      ),
      child: const CircleAvatar(
        backgroundColor: kdarkBlue,
        radius: 32,
        child: Icon(
          Icons.chat,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
