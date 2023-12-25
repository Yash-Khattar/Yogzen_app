import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/services/auth_services.dart';
import 'package:yogzen/services/yoga_services.dart';
import 'package:yogzen/components/nav_bar_screen.dart';
import 'package:yogzen/providers/user_provider.dart';
import 'package:yogzen/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  YogaServices yogaServices = YogaServices();
  AuthServices authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    checkUserDataAndNavigate(context);
  }

  void checkUserDataAndNavigate(BuildContext context) async {
    await authServices.getUserData(context: context);
    await yogaServices.getYogaData(context);

    // Check if user data exists in the provider
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .token
        .isNotEmpty) {
      Navigator.pushReplacementNamed(context, NavScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RippleAnimation(
              color: kdarkBlue,
              delay: const Duration(milliseconds: 300),
              repeat: true,
              minRadius: 200,
              ripplesCount: 6,
              duration: const Duration(milliseconds: 6 * 300),
              child: Image.asset(
                "assets/welcome.png",
                fit: BoxFit.cover,
                scale: 1.2,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            "Getting stuff ready for ya!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
