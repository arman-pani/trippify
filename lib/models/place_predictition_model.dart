import 'dart:convert';

import 'package:flutter/material.dart';

class PlacePredictionModel {
  final String placeId;
  final String text;
  final String mainText;
  final String secondaryText;
  final String type;

  PlacePredictionModel({
    required this.placeId,
    required this.text,
    required this.mainText,
    required this.secondaryText,
    required this.type,
  });

  @override
  String toString() {
    return 'PlacePredictionModel(placeId: $placeId, mainText: $mainText, secondaryText: $secondaryText, type: $type)';
  }

  PlacePredictionModel copyWith({
    String? placeId,
    String? text,
    String? mainText,
    String? secondaryText,
    String? type,
  }) {
    return PlacePredictionModel(
      placeId: placeId ?? this.placeId,
      text: text ?? this.text,
      mainText: mainText ?? this.mainText,
      secondaryText: secondaryText ?? this.secondaryText,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeId': placeId,
      'text': text,
      'mainText': mainText,
      'secondaryText': secondaryText,
      'type': type,
    };
  }

  factory PlacePredictionModel.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> placeDetails = map['placePrediction'];

    debugPrint('Place Details: ${placeDetails.toString()}');

    final structuredFormat = placeDetails['structuredFormat'] ?? {};
    final mainText = structuredFormat['mainText']?['text'] ?? '';
    final secondaryText =
        structuredFormat['secondaryText']?['text'] ?? mainText;
    return PlacePredictionModel(
      placeId: placeDetails['placeId'] ?? '',
      text: placeDetails['text']['text'] ?? '',
      mainText: mainText,
      secondaryText: secondaryText,
      type: (placeDetails['types'] as List<dynamic>?)?.firstWhere(
            (type) => ["country", "locality", "landmark"].contains(type),
            orElse: () => '',
          ) ??
          '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlacePredictionModel.fromJson(String source) =>
      PlacePredictionModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlacePredictionModel &&
        other.placeId == placeId &&
        other.mainText == mainText &&
        other.secondaryText == secondaryText &&
        other.type == type;
  }

  @override
  int get hashCode {
    return placeId.hashCode ^
        mainText.hashCode ^
        secondaryText.hashCode ^
        type.hashCode;
  }
}
