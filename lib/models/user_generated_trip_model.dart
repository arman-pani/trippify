import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:trippify/models/daywise_plan_model.dart';
import 'package:trippify/models/flight_ticket_model.dart';
import 'package:trippify/models/train_ticket_model.dart';

part "user_generated_trip_model.g.dart";

@HiveType(typeId: 0)
class UserGeneratedTripModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String imagePath;
  @HiveField(4)
  final String costPerPerson;
  @HiveField(5)
  final String startDate;
  @HiveField(6)
  final String endDate;
  @HiveField(7)
  final String destination;
  @HiveField(8)
  final int budget;
  @HiveField(9)
  final int peopleCount;
  @HiveField(10)
  final List<DaywisePlanModel> itinerary;
  @HiveField(11)
  final FlightTicketModel outboundFlightTicket;
  @HiveField(12)
  final TrainTicketModel outboundTrainTicket;
  @HiveField(13)
  final FlightTicketModel returnFlightTicket;
  @HiveField(14)
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
