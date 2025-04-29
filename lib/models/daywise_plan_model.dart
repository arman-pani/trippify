import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DaywisePlanModel {
  final String place;
  final DateTime planDateTime;
  final List<POIModel> poiList;

  DaywisePlanModel({
    required this.place,
    required this.planDateTime,
    required this.poiList,
  });

  DaywisePlanModel copyWith({
    String? place,
    DateTime? planDateTime,
    List<POIModel>? poiList,
  }) {
    return DaywisePlanModel(
      place: place ?? this.place,
      planDateTime: planDateTime ?? this.planDateTime,
      poiList: poiList ?? this.poiList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'place': place,
      'planDateTime': planDateTime,
      'poiList': poiList.map((x) => x.toMap()).toList(),
    };
  }

  factory DaywisePlanModel.fromMap(Map<String, dynamic> map) {
    return DaywisePlanModel(
      place: map['place'] ?? '',
      planDateTime: DateTime.parse(map['planDateTime']),
      poiList:
          List<POIModel>.from(map['poiList']?.map((x) => POIModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DaywisePlanModel.fromJson(String source) =>
      DaywisePlanModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DaywisePlanModel(place: $place, planDateTime: $planDateTime, poiList: $poiList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DaywisePlanModel &&
        other.place == place &&
        other.planDateTime == planDateTime &&
        listEquals(other.poiList, poiList);
  }

  @override
  int get hashCode => place.hashCode ^ planDateTime.hashCode ^ poiList.hashCode;
}

class POIModel {
  final String placeToVisit;
  final int costPerPerson;
  final int totalTimeToCover;
  final TimeOfDay startTime;
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
