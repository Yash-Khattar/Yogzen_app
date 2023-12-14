import 'package:flutter/material.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/screens/challenge/components/challenge_card.dart';

class ChallengeScreen extends StatelessWidget{
  const ChallengeScreen ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: klightBlue,
      appBar: AppBar(
        backgroundColor: kdarkBlueMuted,
        title: Text('30 Days Yoga Challenge',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return yogaChallengeCard(day: index + 1);
        }
        )
    );
  }
}