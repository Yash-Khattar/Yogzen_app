import 'package:flutter/material.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/openAI/open_AI.dart';
import 'package:yogzen/screens/chatbot.dart/components/chatBubble.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/ChatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatBubble> _chatBubbles = [];
  String curr = "";

  void _handleSubmitted() {
    _controller.clear();

    // User's message
    ChatBubble userBubble = ChatBubble(
      message: curr,
      isUser: true,
    );

    // Add user's message to the chat
    setState(() {
      _chatBubbles.add(userBubble);
    });

    // Get response from the chatbot
    fetchYogaPose(curr).then((String response) {
      // Bot's response
      ChatBubble botBubble = ChatBubble(
        message: response,
        isUser: false,
      );

      // Add bot's response to the chat
      setState(() {
        _chatBubbles.add(botBubble);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightBlue,
      appBar: AppBar(
        title: Text('Aditya Nath Yogi'),
        backgroundColor: klightBlue,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                reverse: true,
                itemCount: _chatBubbles.length,
                itemBuilder: (_, int index) =>
                    _chatBubbles[_chatBubbles.length - 1 - index],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
              child: TextField(
                controller: _controller,
                onSubmitted: (_) => _handleSubmitted,
                onChanged: (value) => setState(() {
                  curr = value;
                }),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: kdarkBlue,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: kdarkBlue,
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: kdarkBlue,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(8),
                  hintText: 'Ask something about Yoga.',
                  hintStyle: TextStyle(color: kdarkBlue),
                  suffixIcon: IconButton(
                    onPressed: _handleSubmitted,
                    icon: Icon(
                      Icons.send,
                      size: 28,
                    ),
                  ),
                  suffixIconColor: _controller.text == ""
                      ? kdarkBlueMuted.withOpacity(0.5)
                      : kdarkBlue,
                ),
                // style: TextStyle(overflow: TextOverflow.visible),
                maxLines: 1,
                // expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
