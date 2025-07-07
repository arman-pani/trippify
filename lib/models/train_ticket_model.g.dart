// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_ticket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainTicketModelAdapter extends TypeAdapter<TrainTicketModel> {
  @override
  final int typeId = 2;

  @override
  TrainTicketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainTicketModel(
      trainName: fields[0] as String,
      trainNumber: fields[1] as String,
      departureDateTime: fields[2] as DateTime,
      arrivalDateTime: fields[3] as DateTime,
      price: fields[4] as int,
      direction: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrainTicketModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.trainName)
      ..writeByte(1)
      ..write(obj.trainNumber)
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
      other is TrainTicketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
