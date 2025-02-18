// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnimalDTO.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalDTOAdapter extends TypeAdapter<AnimalDTO> {
  @override
  final int typeId = 0;

  @override
  AnimalDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimalDTO(
      id: fields[0] as int,
      organizationId: fields[1] as String,
      type: fields[2] as String,
      species: fields[3] as String,
      breeds: fields[4] as Breeds,
      age: fields[5] as String,
      gender: fields[6] as String,
      name: fields[7] as String,
      description: fields[8] as String?,
      photos: (fields[9] as List).cast<Photo>(),
      primaryPhotoCropped: fields[10] as Photo?,
      status: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnimalDTO obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.organizationId)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.breeds)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.photos)
      ..writeByte(10)
      ..write(obj.primaryPhotoCropped)
      ..writeByte(11)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
