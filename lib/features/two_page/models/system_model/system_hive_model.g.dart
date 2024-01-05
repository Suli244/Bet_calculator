// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SystemHiveModelAdapter extends TypeAdapter<SystemHiveModel> {
  @override
  final int typeId = 1;

  @override
  SystemHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SystemHiveModel(
      result: fields[0] as String,
      stakeAmount: fields[1] as String,
      from: fields[2] as String,
      systemType: fields[3] as String,
      coefficients: (fields[4] as List).cast<String>(),
      date: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SystemHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.result)
      ..writeByte(1)
      ..write(obj.stakeAmount)
      ..writeByte(2)
      ..write(obj.from)
      ..writeByte(3)
      ..write(obj.systemType)
      ..writeByte(4)
      ..write(obj.coefficients)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
