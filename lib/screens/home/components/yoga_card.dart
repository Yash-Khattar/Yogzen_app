import 'package:flutter/material.dart';

class YogaCard extends StatelessWidget {
  const YogaCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
            child: Container(
              width: width * 0.8,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: const Offset(8, 20),
                    blurRadius: 24,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
