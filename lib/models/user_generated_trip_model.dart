import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:trippify/models/daywise_plan_model.dart';

class UserGeneratedTripModel {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final String costPerPerson;
  final String startDate;
  final String endDate;
  final String destination;
  final int budget;
  final int peopleCount;
  final List<DaywisePlanModel> itinerary;
  final FlightTicketModel outboundFlightTicket;
  final TrainTicketModel outboundTrainTicket;
  final FlightTicketModel returnFlightTicket;
  final TrainTicketModel returnTrainTicket;

  UserGeneratedTripModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.costPerPerson,
    required this.startDate,
    required this.endDate,
    required this.destination,
    required this.budget,
    required this.peopleCount,
    required this.itinerary,
    required this.outboundFlightTicket,
    required this.outboundTrainTicket,
    required this.returnFlightTicket,
    required this.returnTrainTicket,
  });

  UserGeneratedTripModel copyWith({
    String? id,
    String? name,
    String? description,
    String? imagePath,
    String? costPerPerson,
    String? startDate,
    String? endDate,
    String? destination,
    int? budget,
    int? peopleCount,
    List<DaywisePlanModel>? itinerary,
    FlightTicketModel? outboundFlightTicket,
    TrainTicketModel? outboundTrainTicket,
    FlightTicketModel? returnFlightTicket,
    TrainTicketModel? returnTrainTicket,
  }) {
    return UserGeneratedTripModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      costPerPerson: costPerPerson ?? this.costPerPerson,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      destination: destination ?? this.destination,
      budget: budget ?? this.budget,
      peopleCount: peopleCount ?? this.peopleCount,
      itinerary: itinerary ?? this.itinerary,
      outboundFlightTicket: outboundFlightTicket ?? this.outboundFlightTicket,
      outboundTrainTicket: outboundTrainTicket ?? this.outboundTrainTicket,
      returnFlightTicket: returnFlightTicket ?? this.returnFlightTicket,
      returnTrainTicket: returnTrainTicket ?? this.returnTrainTicket,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'costPerPerson': costPerPerson,
      'startDate': startDate,
      'endDate': endDate,
      'destination': destination,
      'budget': budget,
      'peopleCount': peopleCount,
      'itinerary': itinerary.map((x) => x.toMap()).toList(),
      'outboundFlightTicket': outboundFlightTicket.toMap(),
      'outboundTrainTicket': outboundTrainTicket.toMap(),
      'returnFlightTicket': returnFlightTicket.toMap(),
      'returnTrainTicket': returnTrainTicket.toMap(),
    };
  }

  factory UserGeneratedTripModel.fromMap(Map<String, dynamic> map) {
    return UserGeneratedTripModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imagePath: map['imagePath'] ?? '',
      costPerPerson: map['costPerPerson'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      destination: map['destination'] ?? '',
      budget: map['budget'] ?? 0,
      peopleCount: map['peopleCount'] ?? 0,
      itinerary: List<DaywisePlanModel>.from(
          map['itinerary']?.map((x) => DaywisePlanModel.fromMap(x))),
      outboundFlightTicket:
          FlightTicketModel.fromMap(map['outboundFlightTicket']),
      outboundTrainTicket: TrainTicketModel.fromMap(map['outboundTrainTicket']),
      returnFlightTicket: FlightTicketModel.fromMap(map['returnFlightTicket']),
      returnTrainTicket: TrainTicketModel.fromMap(map['returnTrainTicket']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserGeneratedTripModel.fromJson(String source) =>
      UserGeneratedTripModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserGeneratedTripModel(id: $id, name: $name, description: $description, imagePath: $imagePath, costPerPerson: $costPerPerson, startDate: $startDate, endDate: $endDate, destination: $destination, budget: $budget, peopleCount: $peopleCount, itinerary: $itinerary, outboundFlightTicket: $outboundFlightTicket, outboundTrainTicket: $outboundTrainTicket, returnFlightTicket: $returnFlightTicket, returnTrainTicket: $returnTrainTicket)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserGeneratedTripModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.imagePath == imagePath &&
        other.costPerPerson == costPerPerson &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.destination == destination &&
        other.budget == budget &&
        other.peopleCount == peopleCount &&
        listEquals(other.itinerary, itinerary) &&
        other.outboundFlightTicket == outboundFlightTicket &&
        other.outboundTrainTicket == outboundTrainTicket &&
        other.returnFlightTicket == returnFlightTicket &&
        other.returnTrainTicket == returnTrainTicket;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        imagePath.hashCode ^
        costPerPerson.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        destination.hashCode ^
        budget.hashCode ^
        peopleCount.hashCode ^
        itinerary.hashCode ^
        outboundFlightTicket.hashCode ^
        outboundTrainTicket.hashCode ^
        returnFlightTicket.hashCode ^
        returnTrainTicket.hashCode;
  }
}

class FlightTicketModel {
  final String airline;
  final String flightNumber;
  final DateTime departureDateTime;
  final DateTime arrivalDateTime;
  final int price;
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

class TrainTicketModel {
  final String trainName;
  final String trainNumber;
  final DateTime departureDateTime;
  final DateTime arrivalDateTime;
  final int price;
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
