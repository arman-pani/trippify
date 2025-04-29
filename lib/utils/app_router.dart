import 'package:flutter/material.dart';
import 'package:trippify/models/user_generated_trip_model.dart';
import 'package:trippify/pages/create_trip_page.dart';
import 'package:trippify/pages/detailed_trip_page.dart';
import 'package:trippify/pages/trip_page.dart';

class AppRouter {
  static MaterialPageRoute tripItineraryPage(UserGeneratedTripModel tripModel) {
    return MaterialPageRoute(
      builder: (context) => DetailedTripPage(tripModel: tripModel),
    );
  }

  static MaterialPageRoute tripPage(UserGeneratedTripModel tripModel) {
    return MaterialPageRoute(
      builder: (context) => TripPage(tripModel: tripModel),
    );
  }

  static MaterialPageRoute createTripPage() {
    return MaterialPageRoute(
      builder: (context) => CreateTripPage(),
    );
  }
}
