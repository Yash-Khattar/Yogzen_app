// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

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
      '_id': id,
      'yoga_name': name,
      'image_url': imageUrl,
      'steps_list': stepsList,
      'step_duration': stepDuration,
      'health_tag': healthTag,
      'total_duration': totalDuration,
    };
  }

  factory Yoga.fromMap(Map<String, dynamic> map) {
    return Yoga(
      id: map['_id'] as String,
      name: map['yoga_name'] as String,
      imageUrl: map['image_url'] as String,
      stepsList: List.from(map['steps_list'] as List),
      stepDuration: List.from(map['step_duration'] as List),
      healthTag: map['health_tag'] as String,
      totalDuration: map['total_duration'].toString() ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Yoga.fromJson(String source) =>
      Yoga.fromMap(json.decode(source) as Map<String, dynamic>);
}
