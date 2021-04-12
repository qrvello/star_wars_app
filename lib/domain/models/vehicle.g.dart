// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleAdapter extends TypeAdapter<Vehicle> {
  @override
  final int typeId = 3;

  @override
  Vehicle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehicle(
      name: fields[0] as String,
      model: fields[1] as String,
      manufacturer: fields[2] as String,
      costInCredits: fields[3] as String,
      length: fields[4] as String,
      maxAtmospheringSpeed: fields[5] as String,
      crew: fields[6] as String,
      passengers: fields[7] as String,
      cargoCapacity: fields[8] as String,
      consumables: fields[9] as String,
      vehicleClass: fields[10] as String,
      pilots: (fields[11] as List)?.cast<dynamic>(),
      films: (fields[12] as List)?.cast<dynamic>(),
      created: fields[13] as DateTime,
      edited: fields[14] as DateTime,
      url: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Vehicle obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.manufacturer)
      ..writeByte(3)
      ..write(obj.costInCredits)
      ..writeByte(4)
      ..write(obj.length)
      ..writeByte(5)
      ..write(obj.maxAtmospheringSpeed)
      ..writeByte(6)
      ..write(obj.crew)
      ..writeByte(7)
      ..write(obj.passengers)
      ..writeByte(8)
      ..write(obj.cargoCapacity)
      ..writeByte(9)
      ..write(obj.consumables)
      ..writeByte(10)
      ..write(obj.vehicleClass)
      ..writeByte(11)
      ..write(obj.pilots)
      ..writeByte(12)
      ..write(obj.films)
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
      other is VehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
