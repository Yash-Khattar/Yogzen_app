import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/models/yoga.dart';

class YogaScreen extends StatefulWidget {
  static String routeName = "/yoga";

  const YogaScreen({super.key});

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  bool isCompleted = false;
  int currentStepIndex = -1;

  Future<void> startYoga(
      List<String> stepsList, List<dynamic> stepDuration, String name) async {
    setState(() {
      isPlaying = true;
    });
    flutterTts.setVoice({"name": "en-in-x-ene-network", "locale": "en-IN"});
    flutterTts.speak("Starting $name in 3  2  1");
    await Future.delayed(const Duration(seconds: 3));

    int count = 0;
    for (int i = 0; i < stepsList.length; i++) {
      if (!isPlaying) break;
      setState(() {
        currentStepIndex = i;
      });
      await flutterTts.speak(stepsList[i]);
      await Future.delayed(Duration(seconds: stepDuration[i].toInt()));
      count++;
    }
    if (count == stepsList.length - 1) {
      await flutterTts.speak("Congratulations! You have completed $name");
    }

    setState(() {
      isPlaying = false;
      isCompleted = true;
    });
  }

  @override
  void dispose() async {
    if (isPlaying) {
      setState(() {
        isPlaying = false;
      });

      await flutterTts.stop();
    }
    super.dispose();
  }

  void stop() {
    flutterTts.stop();
    isPlaying = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Yoga yoga = ModalRoute.of(context)!.settings.arguments as Yoga;
    return Scaffold(
      backgroundColor: klightBlue,
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Image.network(
                  yoga.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 16,
                  child: Text(
                    yoga.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Steps",
                    style: Theme.of(context).textTheme.headlineMedium!)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: yoga.stepsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.play_circle_outline_rounded,
                      color: (index == currentStepIndex)
                          ? kdarkBlue
                          : Colors.black),
                  title: Text(
                    yoga.stepsList[index],
                    style: TextStyle(
                        color: (index == currentStepIndex)
                            ? kdarkBlue
                            : Colors.black),
                  ),
                  trailing: Text(
                    "${yoga.stepDuration[index]}s",
                    style: TextStyle(
                        color: (index == currentStepIndex)
                            ? kdarkBlue
                            : Colors.black),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: (isPlaying)
                  ? () {
                      stop();
                    }
                  : () {
                      startYoga(yoga.stepsList, yoga.stepDuration, yoga.name);
                    },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kdarkBlue,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(8, 20),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    (isPlaying) ? "Stop" : "Start",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
