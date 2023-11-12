import 'package:flutter/material.dart';

class PimaryTextfield extends StatelessWidget {
  final String hinttext;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const PimaryTextfield({super.key, required this.hinttext, this.keyboardType, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hinttext,
      ),
    );
  }
}
