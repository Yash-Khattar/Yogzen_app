import 'package:flutter/material.dart';

import '../../../global/color.dart';

class YogaCardSN extends StatelessWidget {
  const YogaCardSN({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Container(
      // height: height * 0.08,
      // width: width * 3 / 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kdarkBlueMuted,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(2, 2),
              color: Colors.black26),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.play_circle_outline_rounded,
            size: 36,
            color: kdarkBlueMuted,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tada Aasan",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: kblackHeading)),
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
          )
        ],
      ),
    );
  }
}

class YogaCardSNBig extends StatelessWidget {
  const YogaCardSNBig({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      // height: height * 0.08,
      width: width * 4 / 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kdarkBlueMuted,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(2, 2),
              color: Colors.black26),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/welcome.png",
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.play_circle_outline_rounded,
                size: 36,
                color: kdarkBlueMuted,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tada Aasan",
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
