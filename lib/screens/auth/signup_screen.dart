import 'package:flutter/material.dart';
import 'package:yogzen/components/textfield.dart';
import 'package:yogzen/global/color.dart';

class Signup extends StatelessWidget {
  const Signup(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.nameController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(
        children: [
          PimaryTextfield(
            controller: nameController,
            hinttext: "Name",
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 16,
          ),
          PimaryTextfield(
            controller: emailController,
            hinttext: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          PimaryTextfield(
            controller: passwordController,
            hinttext: "Password",
            keyboardType: TextInputType.visiblePassword,
          ),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kdarkBlue,
              ),
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
