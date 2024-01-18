import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import '../global/baseurl.dart';

Random random = Random();

// List<Map<String, String>> l = [];

final List<String> yogaPhrases = [
    "I'm really passionate about yoga, so I'd love to stick to that topic if you don't mind.",
    "Yoga is a topic I'm excited about. Let's focus on that for now.",
    "I'm here to chat about yoga! Any yoga-related questions are welcome.",
    "Yoga is my main interest, so I'd prefer to keep our conversation centered around it.",
    "Let's make our discussion all about yoga. Feel free to ask anything related to it.",
    "Yoga is my expertise, and I'm happy to share my knowledge on that subject.",
    "For today, I'm dedicating our conversation to yoga. Ask me anything about it!",
    "I'm in a yoga mindset right now, so let's explore yoga-related topics together.",
    "I'm here to dive deep into yoga discussions. Other topics might not be my forte.",
    "I'm ready for a yoga-focused conversation. Bring on the yoga questions!",
  ];

Future<String> fetchYogaPose(String question) async {
    
    const String apiUrl = 'https://api.openai.com/v1/chat/completions';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
  // final String question = "Tell me something that is good for mental and physical health.";
  final String prompt = 'Is the following topic related to yoga? Answer in yes or no and then generate the answer in 50 words only if the question is related to yoga.$question';

    final Map<String, dynamic> data = {
      'messages' : [{"role": "user", "content": prompt}],
      'model' : "gpt-3.5-turbo",
      'max_tokens': 256,
      'temperature' : 1
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(data),
    );
    // print(response.statusCode);
    // print(response.body);
    
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    //print(jsonResponse);

    String content = jsonResponse["choices"][0]["message"]["content"];

    if(content.startsWith("Yes")){
      content = content.substring(4);
      content = content.trimLeft();
      if(content.isEmpty){
        content = yogaPhrases[random.nextInt(10)];
      }
    }
    else{
      if(question.contains("Hi") || question.contains("hello") || question.contains("hi")|| question.contains("Hey")|| question.contains("Hello") || question.contains("hey")){
        content = "Hi! " + yogaPhrases[random.nextInt(10)];
      }
      else{
        content = yogaPhrases[random.nextInt(10)];
      }
    }

    //print(content);
    // print(l);

    if (response.statusCode == 200) {
      return content;
    } else {
      throw Exception('Failed to load data');
    }
  }
