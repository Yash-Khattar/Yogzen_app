import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/yoga_provider.dart';
import 'package:yogzen/screens/challenge/components/challenge_card.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final yoga = Provider.of<YogaProvider>(context).yogaData;
    return Scaffold(
      backgroundColor: klightBlue,
      appBar: AppBar(
        backgroundColor: kdarkBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '10 Days Yoga Challenge',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: yoga.length,
        itemBuilder: (context, index) {
          return yogaChallengeCard(day: index + 1);
        },
      ),
    );
  }
}
