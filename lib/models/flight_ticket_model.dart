import 'dart:convert';

import 'package:hive/hive.dart';

part "flight_ticket_model.g.dart";

@HiveType(typeId: 1)
class FlightTicketModel {
  @HiveField(0)
  final String airline;

  @HiveField(1)
  final String flightNumber;

  @HiveField(2)
  final DateTime departureDateTime;

  @HiveField(3)
  final DateTime arrivalDateTime;

  @HiveField(4)
  final int price;

  @HiveField(5)
  final String direction;

  FlightTicketModel({
    required this.airline,
    required this.flightNumber,
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.price,
    required this.direction,
  });

  FlightTicketModel copyWith({
    String? airline,
    String? flightNumber,
    DateTime? departureDateTime,
    DateTime? arrivalDateTime,
    int? price,
    String? direction,
  }) {
    return FlightTicketModel(
      airline: airline ?? this.airline,
      flightNumber: flightNumber ?? this.flightNumber,
      departureDateTime: departureDateTime ?? this.departureDateTime,
      arrivalDateTime: arrivalDateTime ?? this.arrivalDateTime,
      price: price ?? this.price,
      direction: direction ?? this.direction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'airline': airline,
      'flightNumber': flightNumber,
      'departureDateTime': departureDateTime.millisecondsSinceEpoch,
      'arrivalDateTime': arrivalDateTime.millisecondsSinceEpoch,
      'price': price,
      'direction': direction,
    };
  }

  factory FlightTicketModel.fromMap(Map<String, dynamic> map) {
    return FlightTicketModel(
      airline: map['airline'] ?? '',
      flightNumber: map['flightNumber'] ?? '',
      departureDateTime: DateTime.parse(map['departureDateTime']),
      arrivalDateTime: DateTime.parse(map['arrivalDateTime']),
      price: map['price'] ?? 0,
      direction: map['direction'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FlightTicketModel.fromJson(String source) =>
      FlightTicketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FlightTicketModel(airline: $airline, flightNumber: $flightNumber, departureDateTime: $departureDateTime, arrivalDateTime: $arrivalDateTime, price: $price, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlightTicketModel &&
        other.airline == airline &&
        other.flightNumber == flightNumber &&
        other.departureDateTime == departureDateTime &&
        other.arrivalDateTime == arrivalDateTime &&
        other.price == price &&
        other.direction == direction;
  }

  @override
  int get hashCode {
    return airline.hashCode ^
        flightNumber.hashCode ^
        departureDateTime.hashCode ^
        arrivalDateTime.hashCode ^
        price.hashCode ^
        direction.hashCode;
  }
}
