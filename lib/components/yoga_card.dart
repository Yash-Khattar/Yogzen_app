import 'package:flutter/material.dart';
import 'package:yogzen/models/yoga.dart';
import 'package:yogzen/screens/yoga/yoga_screen.dart';

import '../../global/color.dart';

class YogaCard extends StatelessWidget {
  final Yoga yoga;
  const YogaCard({super.key, required this.yoga});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, YogaScreen.routeName, arguments: yoga);
      },
      child: Stack(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(2, 2),
                    color: Colors.black26,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  yoga.imageUrl,

                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 8),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0.8),
                  ],
                  stops: const [0, 0.3],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(16),
                //   bottomRight: Radius.circular(16),
                // ),
              ),
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
                      const Icon(Icons.access_time_rounded,
                          size: 14, color: Colors.black45),
                      const SizedBox(
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
            ),
          ),
        ],
      ),
    );
  }
