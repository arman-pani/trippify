import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trippify/models/user_request_trip.dart';

class TripDataProvider {
  Future<String> getAIGeneratedTrip(UserRequestTrip tripRequest) async {
    const String url = "http://192.168.29.69:8000/plan-trip";

    debugPrint("Trip Request: ${tripRequest.toJson()}");

    final Object requestBody = tripRequest.toJson();

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        debugPrint("AI Generated Trip: ${response.body}");
        return response.body;
      } else {
        throw Exception(
            "Failed to fetch AI generated trip: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch AI generated trip: $e");
    }
  }
}
