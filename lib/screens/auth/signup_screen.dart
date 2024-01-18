import 'package:flutter/material.dart';
import 'package:yogzen/components/textfield.dart';
import 'package:yogzen/global/color.dart';
import 'package:yogzen/services/auth_services.dart';

class Signup extends StatefulWidget {
  Signup(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.nameController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isSignupTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(
        children: [
          PimaryTextfield(
            controller: widget.nameController,
            hinttext: "Name",
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 16,
          ),
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
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              setState(() {
                isSignupTapped = true;
              });
              AuthServices()
                  .postSignUp(
                      context: context,
                      name: widget.nameController.text,
                      email: widget.emailController.text,
                      password: widget.passwordController.text)
                  .then((value) {
                setState(() {
                  isSignupTapped = value;
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
                child: isSignupTapped
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
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
