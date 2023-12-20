import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/components/nav_bar_screen.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/providers/user_provider.dart';
import 'package:yogzen/screens/auth/auth_screen.dart';
import 'package:yogzen/screens/chatbot.dart/chatbot.dart';
import 'package:yogzen/screens/welcome/welcome_screen.dart';
import 'package:yogzen/services/auth_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthServices authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    // authServices.clearSharedPrefs();
    authServices.getUserData(context: context);
  }

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
        ChatScreen.routeName: (context) => ChatScreen(),
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        // YogGuru.routeName: (context) => YogGuru(),
        // Camera.routeName: (context) => Camera(),
        // SpecificNeeds.routeName: (context) => SpecificNeeds(),
      },
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? NavScreen()
          : WelcomeScreen(),
    );
  }
}
