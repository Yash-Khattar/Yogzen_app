import 'package:flutter/material.dart';

class UserInfoItem extends StatelessWidget {
  final String label;
  final String value;

  UserInfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value),
        SizedBox(height: 5.0),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}