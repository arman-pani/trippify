// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_generated_trip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGeneratedTripModelAdapter
    extends TypeAdapter<UserGeneratedTripModel> {
  @override
  final int typeId = 0;

  @override
  UserGeneratedTripModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserGeneratedTripModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      imagePath: fields[3] as String,
      costPerPerson: fields[4] as String,
      startDate: fields[5] as String,
      endDate: fields[6] as String,
      destination: fields[7] as String,
      budget: fields[8] as int,
      peopleCount: fields[9] as int,
      itinerary: (fields[10] as List).cast<DaywisePlanModel>(),
      outboundFlightTicket: fields[11] as FlightTicketModel,
      outboundTrainTicket: fields[12] as TrainTicketModel,
      returnFlightTicket: fields[13] as FlightTicketModel,
      returnTrainTicket: fields[14] as TrainTicketModel,
    );
  }

  @override
  void write(BinaryWriter writer, UserGeneratedTripModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.costPerPerson)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.destination)
      ..writeByte(8)
      ..write(obj.budget)
      ..writeByte(9)
      ..write(obj.peopleCount)
      ..writeByte(10)
      ..write(obj.itinerary)
      ..writeByte(11)
      ..write(obj.outboundFlightTicket)
      ..writeByte(12)
      ..write(obj.outboundTrainTicket)
      ..writeByte(13)
      ..write(obj.returnFlightTicket)
      ..writeByte(14)
      ..write(obj.returnTrainTicket);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGeneratedTripModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
