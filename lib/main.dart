import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yogzen/components/nav_bar.dart';
import 'package:yogzen/components/nav_bar_screen.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/screens/auth/auth_screen.dart';
import 'package:yogzen/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YogZen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kdarkBlue),
          fontFamily: GoogleFonts.outfit().fontFamily,
          useMaterial3: true,
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: kblackHeading,
            ),
            headlineLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: kblackHeading,
            ),
            headlineMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kblackHeading,
            ),
          )),
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(),
        NavScreen.routeName: (context) => NavScreen(),
        // YogGuru.routeName: (context) => YogGuru(),
        // Camera.routeName: (context) => Camera(),
        // SpecificNeeds.routeName: (context) => SpecificNeeds(),
      },
      home: NavScreen(),
    );
  }
}
