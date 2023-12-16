import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({ super.key });

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

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
            bottom: 50,
            child: Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Text('Birds Chirping in mountains...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: () async {
                        await player.play(AssetSource('audio/bird_chirping.mp3'));
                      },
                      child: Text('Play Song'),
                      ),
                      SizedBox(height: 30,),
                    CircleAvatar(
                      radius: 35,
                      child: IconButton(
                        onPressed: () async {
                          if(isPlaying) {
                            await player.pause();
                          } else {
                            await player.play(AssetSource('audio/bird_chirping.mp3'));
                          }
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          iconSize: 40,
                        ),
                    )
                  ],
                )
            ),
          )
        ] 
      )
    );   
  }
}