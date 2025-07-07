import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part "poi_model.g.dart";

@HiveType(typeId: 4)
class POIModel {
  @HiveField(0)
  final String placeToVisit;

  @HiveField(1)
  final int costPerPerson;

  @HiveField(2)
  final int totalTimeToCover;

  @HiveField(3)
  final TimeOfDay startTime;

  @HiveField(4)
  final TimeOfDay endTime;

  POIModel({
    required this.placeToVisit,
    required this.costPerPerson,
    required this.totalTimeToCover,
    required this.startTime,
    required this.endTime,
  });

  POIModel copyWith({
    String? placeToVisit,
    int? costPerPerson,
    int? totalTimeToCover,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return POIModel(
      placeToVisit: placeToVisit ?? this.placeToVisit,
      costPerPerson: costPerPerson ?? this.costPerPerson,
      totalTimeToCover: totalTimeToCover ?? this.totalTimeToCover,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeToVisit': placeToVisit,
      'costPerPerson': costPerPerson,
      'totalTimeToCover': totalTimeToCover,
      'startTime': startTime.toString(),
      'endTime': endTime.toString(),
    };
  }

  factory POIModel.fromMap(Map<String, dynamic> map) {
    return POIModel(
      placeToVisit: map['placeToVisit'] ?? '',
      costPerPerson: map['costPerPerson'] ?? 0,
      totalTimeToCover: map['totalTimeToCover'] ?? 0,
      startTime: TimeOfDay(
        hour: int.parse(map['startTime'].split(':')[0]),
        minute: int.parse(map['startTime'].split(':')[1]),
      ),
      endTime: TimeOfDay(
        hour: int.parse(map['endTime'].split(':')[0]),
        minute: int.parse(map['endTime'].split(':')[1]),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory POIModel.fromJson(String source) =>
      POIModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'POIModel(placeToVisit: $placeToVisit, costPerPerson: $costPerPerson, totalTimeToCover: $totalTimeToCover, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is POIModel &&
        other.placeToVisit == placeToVisit &&
        other.costPerPerson == costPerPerson &&
        other.totalTimeToCover == totalTimeToCover &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return placeToVisit.hashCode ^
        costPerPerson.hashCode ^
        totalTimeToCover.hashCode ^
        startTime.hashCode ^
        endTime.hashCode;
  }
}
