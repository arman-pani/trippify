// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_ticket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlightTicketModelAdapter extends TypeAdapter<FlightTicketModel> {
  @override
  final int typeId = 1;

  @override
  FlightTicketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlightTicketModel(
      airline: fields[0] as String,
      flightNumber: fields[1] as String,
      departureDateTime: fields[2] as DateTime,
      arrivalDateTime: fields[3] as DateTime,
      price: fields[4] as int,
      direction: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FlightTicketModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.airline)
      ..writeByte(1)
      ..write(obj.flightNumber)
      ..writeByte(2)
      ..write(obj.departureDateTime)
      ..writeByte(3)
      ..write(obj.arrivalDateTime)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.direction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlightTicketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
