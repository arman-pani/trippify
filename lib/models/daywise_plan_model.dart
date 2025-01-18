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
}
