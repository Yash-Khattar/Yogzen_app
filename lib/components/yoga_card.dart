import 'package:flutter/material.dart';
import 'package:yogzen/models/yoga.dart';
import 'package:yogzen/screens/yoga/yoga_screen.dart';

import '../../global/color.dart';

class YogaCard extends StatelessWidget {
  final Yoga yoga;
  const YogaCard({super.key, required this.yoga});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, YogaScreen.routeName, arguments: yoga);
      },
      child: Container(
        height: height * 0.2,
        width: width * 3.5 / 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: kdarkBlueMuted,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(8, 20),
              blurRadius: 24,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://lh3.googleusercontent.com/u/5/drive-viewer/AEYmBYTy-QHCrhszX8ElbekQY7xMSconPCiR6Qh4gsIlOXVvMAIh-s96tOwvmeP8-WNYWEBVbwCtyb4HE9mxfMQ8GENIDAfBZw=w1920-h877",
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            "5 Minutes",
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
          ],
        ),
      ),
    );
  }
}
