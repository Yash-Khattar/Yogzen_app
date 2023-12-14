import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yogzen/global/color.dart';

class yogaChallengeCard extends StatelessWidget{
  final int day;

  const yogaChallengeCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      borderOnForeground: true,
      child: ListTile(
        title: Text('Day $day',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Yoga Pose Description for Day $day'),
        trailing: Icon(Icons.check_circle_outline),
        onTap: () {
          //navigation to particular yoga page and snackbar
        },
      ),
    );
  }
}