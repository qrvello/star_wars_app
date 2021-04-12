// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanetAdapter extends TypeAdapter<Planet> {
  @override
  final int typeId = 4;

  @override
  Planet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Planet(
      name: fields[0] as String,
      rotationPeriod: fields[1] as String,
      orbitalPeriod: fields[2] as String,
      diameter: fields[3] as String,
      climate: fields[4] as String,
      gravity: fields[5] as String,
      terrain: fields[6] as String,
      surfaceWater: fields[7] as String,
      population: fields[8] as String,
      residents: (fields[9] as List)?.cast<dynamic>(),
      films: (fields[10] as List)?.cast<dynamic>(),
      created: fields[11] as DateTime,
      edited: fields[12] as DateTime,
      url: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Planet obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rotationPeriod)
      ..writeByte(2)
      ..write(obj.orbitalPeriod)
      ..writeByte(3)
      ..write(obj.diameter)
      ..writeByte(4)
      ..write(obj.climate)
      ..writeByte(5)
      ..write(obj.gravity)
      ..writeByte(6)
      ..write(obj.terrain)
      ..writeByte(7)
      ..write(obj.surfaceWater)
      ..writeByte(8)
      ..write(obj.population)
      ..writeByte(9)
      ..write(obj.residents)
      ..writeByte(10)
      ..write(obj.films)
      ..writeByte(11)
      ..write(obj.created)
      ..writeByte(12)
      ..write(obj.edited)
      ..writeByte(13)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
