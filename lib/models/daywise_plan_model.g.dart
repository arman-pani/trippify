// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daywise_plan_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DaywisePlanModelAdapter extends TypeAdapter<DaywisePlanModel> {
  @override
  final int typeId = 3;

  @override
  DaywisePlanModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DaywisePlanModel(
      place: fields[0] as String,
      planDateTime: fields[1] as DateTime,
      poiList: (fields[2] as List).cast<POIModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DaywisePlanModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.place)
      ..writeByte(1)
      ..write(obj.planDateTime)
      ..writeByte(2)
      ..write(obj.poiList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DaywisePlanModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
