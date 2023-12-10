import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/user_provider.dart';
import 'package:yogzen/screens/home/components/mediatation_card.dart';
import 'dart:math' as math;

import 'package:yogzen/screens/home/components/yoga_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List meditationCards = [
  //   MeditationCard(
  //     imageUrl: "assets/meditation/img1.jpeg",
  //   ),
  //   MeditationCard(
  //     imageUrl: "assets/meditation/img2.jpg",
  //   ),
  //   MeditationCard(
  //     imageUrl: "assets/meditation/img3.jpg",
  //   ),
  //   MeditationCard(
  //     imageUrl: "assets/meditation/img4.jpg",
  //   ),
  // ];

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: klightBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   opacity: 0.3,
                //   image: Image.asset(
                //     "assets/mountain.jpeg",
                //   ).image,
                //   fit: BoxFit.cover,
                // ),

                color: kdarkBlue,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.only(top: 30, left: 12),
                    child: Row(
                      children: [
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: CircleAvatar(
                        //     backgroundImage: Image.asset(
                        //       "assets/profile.png",
                        //       fit: BoxFit.fill,
                        //     ).image,
                        //     // backgroundColor: kdarkBlue,
                        //     radius: 28,
                        //   ),
                        // ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning, ${user.name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // Text(
                            //   'Good Morning!',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  //daily challenge
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: height * 0.12,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            color: kdarkBlueMuted,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -(height * 0.12) / 3,
                          child: CircleAvatar(
                            backgroundColor: kdarkBlueMuted,
                            radius: (height * 0.12) / 2,
                            child: Image.asset(
                              "assets/welcome.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: (height * 0.12) / 10,
                          left: (height * 0.12) - 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Daily Challenge",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Text(
                                    "Start",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // meditation

            Padding(
              padding: const EdgeInsets.only(left: 16, top: 24, bottom: 20),
              child: Text("Meditation",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),

            const Meditation(),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 0),
              child: Text("Yoga Library",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            const YogaCard(),
          ],
        ),
      ),
    );
  }
}
