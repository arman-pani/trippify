import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:trippify/models/poi_model.dart';

part "daywise_plan_model.g.dart";

@HiveType(typeId: 3)
class DaywisePlanModel {
  @HiveField(0)
  final String place;

  @HiveField(1)
  final DateTime planDateTime;

  @HiveField(2)
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
