import 'package:flutter/material.dart';
import 'package:yogzen/global/color.dart';


class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double h = size.height;
    double w = size.width;

    path.moveTo(w / 2, 0);
    path.lineTo(w, h / 4);
    path.lineTo(w, 3 * h / 4);
    path.lineTo(w / 2, h);
    path.lineTo(0, 3 * h / 4);
    path.lineTo(0, h / 4);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HexagonWidget extends StatelessWidget {
  // final ImagePicker _picker = ImagePicker();
  // Future<void> _openCamera() async {
  //   final  pickedFile = await _picker.pickImage(source: ImageSource.camera);
  // }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        decoration: BoxDecoration(
          color: kdarkBlue,
          boxShadow: [
            const BoxShadow(
                offset: Offset(0, 4), blurRadius: 4, color: Colors.black12),
          ],
        ),
        height: 68, // Set the height of your hexagon here
        child: IconButton(
          onPressed: () {
            // Navigator.pushNamed(context, Camera.routeName);
          },
          icon: const Icon(
            Icons.camera,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
