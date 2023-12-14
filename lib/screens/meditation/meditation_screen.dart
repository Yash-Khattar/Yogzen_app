import 'package:flutter/material.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({ super.key });

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/mountain.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: 30,
            right: 30,
            //top: 50,
            bottom: 50,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(150),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text('idhar gaana bajega file submit karni hai isiliye aake bajauga!'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
