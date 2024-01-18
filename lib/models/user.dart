import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;
  final String userid;
  final String userType;
  final String token;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.userid,
    required this.userType,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'user_id': userid,
      'userType': userType,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userid: map['user_id'] as String,
      userType: map['userType'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
