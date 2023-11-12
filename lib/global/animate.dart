// import 'package:flutter/material.dart';

// void animate(AnimationController? controller, Animation<double>? animation) {
//   controller = AnimationController(
//     duration: const Duration(milliseconds: 1000),
//     vsync: this,
//   );
//   animation = Tween<double>(
//     begin: -50,
//     end: 50,
//   ).animate(controller!)
//     ..addListener(() {
//       setState(() {});
//       if (controller!.isCompleted) {
//         controller!.reverse();
//       }
//       if (controller!.isDismissed) {
//         controller!.forward();
//       }
//     });

//   controller!.forward();
// }
