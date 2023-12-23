// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Yoga {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> stepsList;
  final List stepDuration;
  final String healthTag;
  final String totalDuration;

  Yoga(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.stepsList,
      required this.stepDuration,
      required this.healthTag,
      required this.totalDuration});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'stepsList': stepsList,
      'stepDuration': stepDuration,
      'healthTag': healthTag,
      'totalDuration': totalDuration,
    };
  }

  factory Yoga.fromMap(Map<String, dynamic> map) {
    return Yoga(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      stepsList: List<String>.from(map['stepsList'] as List<String>),
      stepDuration: List.from(map['stepDuration'] as List),
      healthTag: map['healthTag'] as String,
      totalDuration: map['totalDuration'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Yoga.fromJson(String source) =>
      Yoga.fromMap(json.decode(source) as Map<String, dynamic>);
}
