// To parse this JSON data, do
//
//     final starship = starshipFromJson(jsonString);

import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:hive/hive.dart';

part 'starship.g.dart';

Starship starshipFromJson(String str) => Starship.fromJson(json.decode(str));

String starshipToJson(Starship data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class Starship {
  Starship({
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
    this.hyperdriveRating,
    this.mglt,
    this.starshipClass,
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
  String hyperdriveRating;

  @HiveField(11)
  String mglt;

  @HiveField(12)
  String starshipClass;

  @HiveField(13)
  List<dynamic> pilots;

  @HiveField(14)
  List<String> films;

  @HiveField(15)
  DateTime created;

  @HiveField(16)
  DateTime edited;

  @HiveField(17)
  String url;

  factory Starship.fromJson(Map<String, dynamic> json) => Starship(
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
        hyperdriveRating: json["hyperdrive_rating"],
        mglt: json["MGLT"],
        starshipClass: json["starship_class"],
        pilots: List<dynamic>.from(json["pilots"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
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
        "hyperdrive_rating": hyperdriveRating,
        "MGLT": mglt,
        "starship_class": starshipClass,
        "pilots": List<dynamic>.from(pilots.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
