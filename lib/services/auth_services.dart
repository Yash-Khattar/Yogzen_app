import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yogzen/components/nav_bar_screen.dart';
import 'package:yogzen/components/snackbar.dart';
import 'package:yogzen/global/baseurl.dart';
import 'package:yogzen/global/error_handling.dart';
import 'package:yogzen/models/user.dart';
import 'package:yogzen/providers/user_provider.dart';

class AuthServices {
  void getYogzen() async {
    var url = Uri.parse('$baseUrl/');
    try {
      var response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );
      if (kDebugMode) {
        print(response.body);
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        print("success");
      } else {
        print("failed");
      }
    } catch (e) {
      print(e);
    }
  }

//signup
  Future<bool> postSignUp(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    User user = User(
      name: name,
      email: email,
      password: password,
      userid: "",
      userType: "USER",
      token: "",
    );
    final RegExp _emailRegExp = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );

    var url = Uri.parse('$baseUrl/users/signup');
    try {
      if (email == "") {
        showSnackBar(context: context, text: "Email cannot be empty");
        return false;
      }

      if (!_emailRegExp.hasMatch(email)) {
        showSnackBar(context: context, text: "Email is not valid");
        return false;
      }

      if (password == "") {
        showSnackBar(context: context, text: "Password cannot be empty");
        return false;
      }
      if (name == "") {
        showSnackBar(context: context, text: "Name cannot be empty");
        return false;
      }

      var response = await http.post(url,
          body: user.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });

      if (context.mounted) {
        httpErrorHandling(
            context: context,
            response: response,
            onSuccess: () {
              postLogin(email: email, password: password, context: context);
            });
        return false;
      }
      return true;
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context: context, text: e.toString());
      }
      return false;
    }
  }

  Future<bool> postLogin(
      {required email,
      required password,
      required BuildContext context}) async {
    var url = Uri.parse('$baseUrl/users/login');

    try {
      if (email == null || email == "") {
        showSnackBar(context: context, text: "Email cannot be empty");
        return false;
      }

      if (password == null || password == "") {
        showSnackBar(context: context, text: "Password cannot be empty");
        return false;
      }
      var response = await http.post(url,
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });
      print(response.body);
      if (context.mounted) {
        httpErrorHandling(
            context: context,
            response: response,
            onSuccess: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              if (context.mounted) {
                Provider.of<UserProvider>(context, listen: false)
                    .setUser(response.body);
              }
              print(jsonDecode(response.body)["token"]);
              await pref.setString("token", jsonDecode(response.body)["token"]);
              await pref.setString(
                  "user_id", jsonDecode(response.body)["user_id"]);

              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                    context, NavScreen.routeName, (route) => false);
              }
            });
        return false;
      }
      return true;
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
      return false;
    }
  }

  //get user data
  Future<void> getUserData({required BuildContext context}) async {
    //fetching token and user id

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? user_id = prefs.getString("user_id");
    user_id ?? prefs.setString("user_id", "");
    token ?? prefs.setString("token", "");

    var url = Uri.parse('$baseUrl/users/$user_id');
    try {
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "token": token!,
        },
      );

      httpErrorHandling(
          context: context,
          response: response,
          onSuccess: () {
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }

  void clearSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
