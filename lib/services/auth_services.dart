import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yogzen/global/baseurl.dart';
import 'package:yogzen/models/user.dart';

class AuthServices {
  final dio = Dio();
//signup
  void postSignUp(
      {required String name,
      required String email,
      required String password}) async {
    User user = User(
      name: name,
      email: email,
      password: password,
      id: "",
    );
    print(user);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      final Response response =
          await dio.post("$baseUrl/auth/signup", data: user.toJson());
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
