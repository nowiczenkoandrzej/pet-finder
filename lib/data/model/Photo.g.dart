// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Photo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 2;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      small: fields[0] as String?,
      medium: fields[1] as String?,
      large: fields[2] as String?,
      full: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.small)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.large)
      ..writeByte(3)
      ..write(obj.full);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
