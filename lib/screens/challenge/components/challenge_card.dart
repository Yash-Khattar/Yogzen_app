import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/yoga_provider.dart';
import 'package:yogzen/screens/yoga/yoga_screen.dart';

class yogaChallengeCard extends StatelessWidget {
  final int day;

  const yogaChallengeCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final yoga = Provider.of<YogaProvider>(context).yogaData;
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      borderOnForeground: true,
      child: ListTile(
        title: Text(
          'Day $day',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          yoga[day - 1].name,
          style: TextStyle(
            color: kblackHeading,
          ),
        ),
        trailing: Icon(
          Icons.check_circle_outline,
          color: kblackSubHeading,
        ),
        onTap: () {
          Navigator.pushNamed(context, YogaScreen.routeName,
              arguments: yoga[day - 1]);
        },
      ),
    );
  }
}
