import 'dart:convert';

import 'package:trippify/utils/enum_classes.dart';

class UserModel {
  final String? id;
  final String username;
  final String? profileImage;
  final String? bio;
  final AgeRange age;
  final TravellerType travellerType;
  final Gender gender;
  final List<String> prefferedPlaces;
  final List<String> prefferedActivities;
  final DateTime creationDateTime;

  UserModel({
    this.id,
    required this.username,
    this.profileImage,
    this.bio,
    required this.age,
    required this.travellerType,
    required this.gender,
    this.prefferedPlaces = const [],
    this.prefferedActivities = const [],
    required this.creationDateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'profileImage': profileImage,
      'bio': bio,
      'age': age.toString(),
      'travellerType': travellerType.toString(),
      'gender': gender.toString(),
      'prefferedPlaces': prefferedPlaces,
      'prefferedActivities': prefferedActivities,
      'creationDateTime': creationDateTime.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'] ?? '',
      profileImage: map['profileImage'],
      bio: map['bio'],
      age: AgeRange.fromString(map['age']),
      travellerType: TravellerType.fromString(map['travellerType']),
      gender: Gender.fromString(map['gender']),
      prefferedPlaces: List<String>.from(map['prefferedPlaces']),
      prefferedActivities: List<String>.from(map['prefferedActivities']),
      creationDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['creationDateTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
