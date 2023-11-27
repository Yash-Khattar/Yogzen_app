import 'package:flutter/material.dart';
import 'dart:math' as math;

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
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
    return SizedBox(
      height: height * 0.24,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          // double offset = pageOffset - index;

          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double pageOffset = 0;
              if (pageController.position.haveDimensions) {
                pageOffset = pageController.page! - index;
              }
              double gauss =
                  math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
              return Transform.translate(
                offset: Offset(-32 * gauss * pageOffset.sign, 0),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(8, 20),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/meditation/img${index + 1}.jpeg',
                          height: height * 0.2,
                          width: width,
                          alignment: Alignment(-pageOffset.abs(), 0),
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.052,
                      left: 30,
                      child: Text(
                        "Meditation ${index + 1}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
