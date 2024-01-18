import 'package:flutter/material.dart';
import 'package:yogzen/models/yoga.dart';

import '../../../global/color.dart';
import '../../yoga/yoga_screen.dart';

class YogaCardSN extends StatelessWidget {
  final Yoga yoga;
  const YogaCardSN({super.key, required this.yoga});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, YogaScreen.routeName, arguments: yoga);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: kdarkBlueMuted,
          ),
          boxShadow: const [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(2, 2),
                color: Colors.black26),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.play_circle_outline_rounded,
                  size: 36,
                  color: kdarkBlueMuted,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      yoga.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kblackHeading),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.access_time_rounded,
                            size: 14, color: Colors.black45),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          yoga.totalDuration + " Minutes",
                          style: TextStyle(
                            color: kblackSubHeading,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}