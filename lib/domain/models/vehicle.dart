// To parse this JSON data, do
//
//     final vehicle = vehicleFromJson(jsonString);

import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:hive/hive.dart';

part 'vehicle.g.dart';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

@HiveType(typeId: 3)
class Vehicle {
  Vehicle({
    this.name,
    this.model,
    this.manufacturer,
    this.costInCredits,
    this.length,
    this.maxAtmospheringSpeed,
    this.crew,
    this.passengers,
    this.cargoCapacity,
    this.consumables,
    this.vehicleClass,
    this.pilots,
    this.films,
    this.created,
    this.edited,
    this.url,
  });
  @HiveField(0)
  String name;

  @HiveField(1)
  String model;

  @HiveField(2)
  String manufacturer;

  @HiveField(3)
  String costInCredits;

  @HiveField(4)
  String length;

  @HiveField(5)
  String maxAtmospheringSpeed;

  @HiveField(6)
  String crew;

  @HiveField(7)
  String passengers;

  @HiveField(8)
  String cargoCapacity;

  @HiveField(9)
  String consumables;

  @HiveField(10)
  String vehicleClass;

  @HiveField(11)
  List<dynamic> pilots;

  @HiveField(12)
  List<dynamic> films;

  @HiveField(13)
  DateTime created;

  @HiveField(14)
  DateTime edited;

  @HiveField(15)
  String url;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        name: json["name"],
        model: json["model"],
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        vehicleClass: json["vehicle_class"],
        pilots: List<dynamic>.from(json["pilots"].map((x) => x)),
        films: List<dynamic>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: StringUtils.addCharAtPosition(json["url"], 's', 4),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "model": model,
        "manufacturer": manufacturer,
        "cost_in_credits": costInCredits,
        "length": length,
        "max_atmosphering_speed": maxAtmospheringSpeed,
        "crew": crew,
        "passengers": passengers,
        "cargo_capacity": cargoCapacity,
        "consumables": consumables,
        "vehicle_class": vehicleClass,
        "pilots": List<dynamic>.from(pilots.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
