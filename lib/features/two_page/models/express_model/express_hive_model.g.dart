// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'express_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpressHiveModelAdapter extends TypeAdapter<ExpressHiveModel> {
  @override
  final int typeId = 0;

  @override
  ExpressHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpressHiveModel(
      result: fields[0] as String,
      stakeAmount: fields[1] as String,
      number: fields[2] as String,
      coefficients: (fields[3] as List).cast<String>(),
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ExpressHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.result)
      ..writeByte(1)
      ..write(obj.stakeAmount)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.coefficients)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpressHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
