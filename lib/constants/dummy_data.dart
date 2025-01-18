import 'package:flutter/material.dart';
import 'package:trippify/models/daywise_plan_model.dart';
import 'package:trippify/models/place_model.dart';
import 'package:trippify/models/recommended_trip_model.dart';

List<RecommendedTripModel> dummyRecommendedTrips = [
  RecommendedTripModel(
    title: "Beach Getaway",
    imagePath: "assets/images/beach_getaway.jpg",
    costPerPerson: 200,
    startDateTime: DateTime(2025, 3, 15, 10, 0),
    endDateTime: DateTime(2025, 3, 20, 18, 0),
  ),
  RecommendedTripModel(
    title: "Mountain Adventure",
    imagePath: "assets/images/mountain_adventure.jpg",
    costPerPerson: 300,
    startDateTime: DateTime(2025, 4, 10, 8, 0),
    endDateTime: DateTime(2025, 4, 15, 17, 0),
  ),
  RecommendedTripModel(
    title: "City Lights Tour",
    imagePath: "assets/images/city_lights.jpg",
    costPerPerson: 150,
    startDateTime: DateTime(2025, 5, 1, 9, 30),
    endDateTime: DateTime(2025, 5, 3, 20, 0),
  ),
  RecommendedTripModel(
    title: "Desert Safari",
    imagePath: "assets/images/desert_safari.jpg",
    costPerPerson: 250,
    startDateTime: DateTime(2025, 6, 5, 7, 0),
    endDateTime: DateTime(2025, 6, 10, 19, 0),
  ),
  RecommendedTripModel(
    title: "Cultural Heritage Tour",
    imagePath: "assets/images/cultural_heritage.jpg",
    costPerPerson: 180,
    startDateTime: DateTime(2025, 7, 20, 10, 0),
    endDateTime: DateTime(2025, 7, 25, 18, 0),
  ),
];

List<DaywisePlanModel> dummyDaywisePlanList = [
  DaywisePlanModel(
    place: "New York City",
    planDateTime: DateTime(2025, 3, 15),
    poiList: [
      POIModel(
        placeToVisit: "Statue of Liberty",
        costPerPerson: 50,
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
      POIModel(
        placeToVisit: "Central Park",
        costPerPerson: 0, // free
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
      POIModel(
        placeToVisit: "Times Square",
        costPerPerson: 20,
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
    ],
  ),
  DaywisePlanModel(
    place: "Paris",
    planDateTime: DateTime(2025, 3, 16),
    poiList: [
      POIModel(
        placeToVisit: "Eiffel Tower",
        costPerPerson: 25,
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
      POIModel(
        placeToVisit: "Louvre Museum",
        costPerPerson: 15,
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
      POIModel(
        placeToVisit: "Champs-Élysées",
        costPerPerson: 10,
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
    ],
  ),
  DaywisePlanModel(
    place: "Tokyo",
    planDateTime: DateTime(2025, 3, 17),
    poiList: [
      POIModel(
        placeToVisit: "Tokyo Tower",
        costPerPerson: 30,
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
      POIModel(
        placeToVisit: "Shinjuku Gyoen National Garden",
        costPerPerson: 5,
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
      POIModel(
        placeToVisit: "Akihabara",
        costPerPerson: 0, // free to roam shopping streets
        totalTimeToCover: 1, // in minutes
        startTime: TimeOfDay(hour: 11, minute: 00),
        endTime: TimeOfDay(hour: 12, minute: 00),
      ),
    ],
  ),
];

final List<PlaceModel> dummyPopularPlaces = [
  PlaceModel(
    name: 'Bali',
    imagePath: 'assets/images/bali.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Yogyakarta',
    imagePath: 'assets/images/yogyakarta.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Banjarbaru',
    imagePath: 'assets/images/banjarbaru.png',
    numberOfDestinations: 30,
  ),
  PlaceModel(
    name: 'Surabaya',
    imagePath: 'assets/images/surabaya.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Sukabumi',
    imagePath: 'assets/images/sukabumi.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Padang',
    imagePath: 'assets/images/padang.png',
    numberOfDestinations: 30,
  ),
  PlaceModel(
    name: 'Bali',
    imagePath: 'assets/images/bali.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Yogyakarta',
    imagePath: 'assets/images/yogyakarta.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Banjarbaru',
    imagePath: 'assets/images/banjarbaru.png',
    numberOfDestinations: 30,
  ),
  PlaceModel(
    name: 'Surabaya',
    imagePath: 'assets/images/surabaya.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Sukabumi',
    imagePath: 'assets/images/sukabumi.png',
    numberOfDestinations: 20,
  ),
  PlaceModel(
    name: 'Padang',
    imagePath: 'assets/images/padang.png',
    numberOfDestinations: 30,
  ),
];
