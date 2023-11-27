import 'package:flutter/material.dart';
import 'package:yogzen/global/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = Tween<double>(
      begin: -50,
      end: 50,
    ).animate(controller!)
      ..addListener(() {
        setState(() {});
        if (controller!.isCompleted) {
          controller!.reverse();
        }
        if (controller!.isDismissed) {
          controller!.forward();
        }
      });

    controller!.forward();
    // The looping is done via listener.
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: klightBlue,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                opacity: 0.7,
                image: Image.asset(
                  'assets/meditation/img2.jpeg',
                ).image,
                fit: BoxFit.cover),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Yogzen',
                  style: TextStyle(
                      color: kblackHeading,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'AI enabled yoga app for all your ',
                  style: TextStyle(color: kblackSubHeading),
                ),
                Text(
                  'yogic needs!',
                  style: TextStyle(color: kblackSubHeading),
                ),
                Spacer(),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  transform: Transform.translate(
                    offset: Offset(0, animation!.value),
                  ).transform,
                  child: Hero(
                    tag: "welcome",
                    child: Container(
                      child: Image.asset('assets/welcome.png'),
                      decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(0.1),
                          //     offset: const Offset(8, 20),
                          //     blurRadius: 24,
                          //   ),
                          // ],
                          ),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/auth");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kdarkBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                    child: Text('Get Started', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )
          ]),
        ));
  }
}
