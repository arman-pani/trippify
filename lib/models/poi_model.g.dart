// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class POIModelAdapter extends TypeAdapter<POIModel> {
  @override
  final int typeId = 4;

  @override
  POIModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return POIModel(
      placeToVisit: fields[0] as String,
      costPerPerson: fields[1] as int,
      totalTimeToCover: fields[2] as int,
      startTime: fields[3] as TimeOfDay,
      endTime: fields[4] as TimeOfDay,
    );
  }

  @override
  void write(BinaryWriter writer, POIModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.placeToVisit)
      ..writeByte(1)
      ..write(obj.costPerPerson)
      ..writeByte(2)
      ..write(obj.totalTimeToCover)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is POIModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
