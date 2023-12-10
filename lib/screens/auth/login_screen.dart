import 'package:flutter/material.dart';
import 'package:yogzen/components/textfield.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/services/auth_services.dart';

class Login extends StatelessWidget {
  const Login(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(
        children: [
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
          Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Forgot Password?"),
                style: TextButton.styleFrom(foregroundColor: Colors.black),
              )),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              AuthServices().postLogin(
                  context: context,
                  email: emailController.text,
                  password: passwordController.text);
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kdarkBlue,
              ),
              child: const Center(
                child: Text(
                  "Log In",
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
