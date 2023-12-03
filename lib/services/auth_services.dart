import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yogzen/global/baseurl.dart';
import 'package:yogzen/models/user.dart';

class AuthServices {
  void getYogzen() async {
    var url = Uri.parse('$baseUrl/');
    try {
      var response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );
      print(response.body);
      print(response.statusCode);
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
  void postSignUp(
      {required String name,
      required String email,
      required String password}) async {
    User user = User(
      name: name,
      email: email,
      password: password,
      userid: "",
      userType: "USER",
    );
    print(user);
    var url = Uri.parse('$baseUrl/auth/signup');
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("success");
      } else {
        print("failed");
      }
    } catch (e) {
      print(e);
    }
  }
}
