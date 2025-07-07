import 'dart:convert';

import 'package:hive/hive.dart';

part "train_ticket_model.g.dart";

@HiveType(typeId: 2)
class TrainTicketModel {
  @HiveField(0)
  final String trainName;

  @HiveField(1)
  final String trainNumber;

  @HiveField(2)
  final DateTime departureDateTime;

  @HiveField(3)
  final DateTime arrivalDateTime;

  @HiveField(4)
  final int price;

  @HiveField(5)
  final String direction;

  TrainTicketModel({
    required this.trainName,
    required this.trainNumber,
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.price,
    required this.direction,
  });

  TrainTicketModel copyWith({
    String? trainName,
    String? trainNumber,
    DateTime? departureDateTime,
    DateTime? arrivalDateTime,
    int? price,
    String? direction,
  }) {
    return TrainTicketModel(
      trainName: trainName ?? this.trainName,
      trainNumber: trainNumber ?? this.trainNumber,
      departureDateTime: departureDateTime ?? this.departureDateTime,
      arrivalDateTime: arrivalDateTime ?? this.arrivalDateTime,
      price: price ?? this.price,
      direction: direction ?? this.direction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'trainName': trainName,
      'trainNumber': trainNumber,
      'departureDateTime': departureDateTime.millisecondsSinceEpoch,
      'arrivalDateTime': arrivalDateTime.millisecondsSinceEpoch,
      'price': price,
      'direction': direction,
    };
  }

  factory TrainTicketModel.fromMap(Map<String, dynamic> map) {
    return TrainTicketModel(
      trainName: map['trainName'] ?? '',
      trainNumber: map['trainNumber'] ?? '',
      departureDateTime: DateTime.parse(map['departureDateTime']),
      arrivalDateTime: DateTime.parse(map['arrivalDateTime']),
      price: map['price']?.toInt() ?? 0,
      direction: map['direction'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainTicketModel.fromJson(String source) =>
      TrainTicketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrainTicketModel(trainName: $trainName, trainNumber: $trainNumber, departureDateTime: $departureDateTime, arrivalDateTime: $arrivalDateTime, price: $price, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainTicketModel &&
        other.trainName == trainName &&
        other.trainNumber == trainNumber &&
        other.departureDateTime == departureDateTime &&
        other.arrivalDateTime == arrivalDateTime &&
        other.price == price &&
        other.direction == direction;
  }

  @override
  int get hashCode {
    return trainName.hashCode ^
        trainNumber.hashCode ^
        departureDateTime.hashCode ^
        arrivalDateTime.hashCode ^
        price.hashCode ^
        direction.hashCode;
  }
}
