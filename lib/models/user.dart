// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;
  final String userid;
  final String userType;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.userid,
    required this.userType,
  });

  User copyWith({
    String? name,
    String? email,
    String? password,
    String? id,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userid: id ?? this.userid, userType: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'id': userid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userid: map['userid'] as String, userType: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, email: $email, password: $password, id: $userid)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.userid == userid;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ password.hashCode ^ userid.hashCode;
  }
}
