import 'package:flutter/material.dart';
import 'package:yogzen/components/textfield.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/services/auth_services.dart';

class Login extends StatefulWidget {
  Login(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoginTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(
        children: [
          PimaryTextfield(
            controller: widget.emailController,
            hinttext: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          PimaryTextfield(
            controller: widget.passwordController,
            hinttext: "Password",
            keyboardType: TextInputType.visiblePassword,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isLoginTapped = true;
              });
              AuthServices()
                  .postLogin(
                      context: context,
                      email: widget.emailController.text,
                      password: widget.passwordController.text)
                  .then((value) {
                setState(() {
                  isLoginTapped = value;
                });
              });
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kdarkBlue,
              ),
              child: Center(
                child: isLoginTapped
                    ? CircularProgressIndicator()
                    : Text(
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
