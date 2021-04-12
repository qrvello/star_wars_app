// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterAdapter extends TypeAdapter<Character> {
  @override
  final int typeId = 1;

  @override
  Character read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Character(
      name: fields[0] as String,
      height: fields[1] as String,
      mass: fields[2] as String,
      hairColor: fields[3] as String,
      skinColor: fields[4] as String,
      eyeColor: fields[5] as String,
      birthYear: fields[6] as String,
      gender: fields[7] as String,
      homeworld: fields[8] as dynamic,
      films: (fields[9] as List)?.cast<dynamic>(),
      species: (fields[10] as List)?.cast<dynamic>(),
      vehicles: (fields[11] as List)?.cast<dynamic>(),
      starships: (fields[12] as List)?.cast<dynamic>(),
      created: fields[13] as DateTime,
      edited: fields[14] as DateTime,
      url: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Character obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.mass)
      ..writeByte(3)
      ..write(obj.hairColor)
      ..writeByte(4)
      ..write(obj.skinColor)
      ..writeByte(5)
      ..write(obj.eyeColor)
      ..writeByte(6)
      ..write(obj.birthYear)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.homeworld)
      ..writeByte(9)
      ..write(obj.films)
      ..writeByte(10)
      ..write(obj.species)
      ..writeByte(11)
      ..write(obj.vehicles)
      ..writeByte(12)
      ..write(obj.starships)
      ..writeByte(13)
      ..write(obj.created)
      ..writeByte(14)
      ..write(obj.edited)
      ..writeByte(15)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
