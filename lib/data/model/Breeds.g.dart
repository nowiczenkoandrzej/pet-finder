// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Breeds.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedsAdapter extends TypeAdapter<Breeds> {
  @override
  final int typeId = 1;

  @override
  Breeds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Breeds(
      primary: fields[0] as String?,
      secondary: fields[1] as String?,
      mixed: fields[2] as bool?,
      unknown: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Breeds obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.primary)
      ..writeByte(1)
      ..write(obj.secondary)
      ..writeByte(2)
      ..write(obj.mixed)
      ..writeByte(3)
      ..write(obj.unknown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
