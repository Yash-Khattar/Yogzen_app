import 'package:flutter/material.dart';
import 'package:yogzen/global/color.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Padding(
              padding: const EdgeInsets.only(right: 6.0, top: 6),
              child: CircleAvatar(
                backgroundColor: klightBlue,
                child: Image.asset(
                  'assets/welcome.png',
                  fit: BoxFit.cover,
                ),
                radius: 16,
              ),
            ),
          Container(
            // width: width / 2 + 64,
            constraints: BoxConstraints(maxWidth: width / 2 + 64),
            // height: ,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: !isUser ? Colors.white : kdarkBlue,
                borderRadius: BorderRadius.circular(16),
                border:
                    isUser ? Border() : Border.all(color: kdarkBlue, width: 2)),
            child: Text(
              message,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: !isUser ? kdarkBlue : Colors.white, fontSize: 15),
            ),
          ),
          if (isUser)
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6),
              child: CircleAvatar(
                backgroundImage: Image.asset(
                  'assets/UserImage.jpeg',
                  fit: BoxFit.cover,
                ).image,
                radius: 16,
              ),
            ),
        ],
      ),
    );
  }
}
