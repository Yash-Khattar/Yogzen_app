import 'package:flutter/material.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/models/yoga.dart';

class YogaScreen extends StatefulWidget {
  static String routeName = "/yoga";

  const YogaScreen({super.key});

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  @override
  Widget build(BuildContext context) {
    Yoga yoga = ModalRoute.of(context)!.settings.arguments as Yoga;
    return Scaffold(
      backgroundColor: klightBlue,
      body: Column(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Image.network(
                  yoga.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: kdarkBlue,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 16,
                  child: Text(
                    yoga.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Steps",
                    style: Theme.of(context).textTheme.headlineMedium!)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: yoga.stepsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.play_circle_outline_rounded),
                  title: Text(yoga.stepsList[index]),
                  trailing: Text(yoga.stepDuration[index].toString() + "s"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kdarkBlue,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(8, 20),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
