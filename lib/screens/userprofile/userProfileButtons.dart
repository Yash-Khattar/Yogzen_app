import 'package:flutter/material.dart';
import 'package:yogzen/screens/welcome/welcome_screen.dart';
import 'package:yogzen/services/auth_services.dart';

class UserProfileButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  UserProfileButtons({required this.title, required this.onPressed});

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                AuthServices().clearSharedPrefs();
                Navigator.pushNamedAndRemoveUntil(
                    context, WelcomeScreen.routeName, (route) => false);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ExpansionTile(
              childrenPadding: EdgeInsets.all(16.0),
              title: Text('Sneak peek'),
              children: [
                Text(
                    'We are working on a ML Model to detect yoga poses, which further can be improved to correct posture, making sure yoga is practiced in correct form. Users can search for Yoga, Diet and complete plan to cure diseases like Backpain, Arthritis, Insomnia etc. We are also planning to introduce a vibrant community section for an enriching experience that goes beyond individual journeys, building a community united by the love for yoga and guided by the wisdom of experienced yog gurus. Stay tuned!')
              ],
            ),
            const ExpansionTile(
              childrenPadding: EdgeInsets.all(16.0),
              title: Text('About us'),
              children: [
                Text(
                    'The dynamic trio behind YogZen: Harsh Tiwari, Yash Khattar and Dhairya Arora, Fueled by passion and driven by innovation. We are crafting an app that transcends boundaries, blending technology with the art of yoga. Join us on a transformative journey, where our dedication harmonizes with your wellness goals. Together, lets redefine tranquility in the digital age.')
              ],
            ),
            const ExpansionTile(
              childrenPadding: EdgeInsets.all(16.0),
              title: Text('Contact us'),
              children: [
                Text(
                    'Feel free to reach out to us at yogzen.app@gmail.com with any queries, suggestions, or feedback. We value your thoughts and are here to assist you on your yoga journey!')
              ],
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
