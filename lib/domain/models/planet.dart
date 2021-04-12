import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:hive/hive.dart';
part 'planet.g.dart';

Planet planetFromJson(String str) => Planet.fromJson(json.decode(str));

String planetToJson(Planet data) => json.encode(data.toJson());

@HiveType(typeId: 4)
class Planet {
  Planet({
    this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
    this.residents,
    this.films,
    this.created,
    this.edited,
    this.url,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String rotationPeriod;

  @HiveField(2)
  String orbitalPeriod;

  @HiveField(3)
  String diameter;

  @HiveField(4)
  String climate;

  @HiveField(5)
  String gravity;

  @HiveField(6)
  String terrain;

  @HiveField(7)
  String surfaceWater;

  @HiveField(8)
  String population;

  @HiveField(9)
  List<dynamic> residents;

  @HiveField(10)
  List<dynamic> films;

  @HiveField(11)
  DateTime created;

  @HiveField(12)
  DateTime edited;

  @HiveField(13)
  String url;

  factory Planet.fromJson(Map<String, dynamic> json) => Planet(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
        residents: List<dynamic>.from(json["residents"].map((x) => x)),
        films: List<dynamic>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: StringUtils.addCharAtPosition(json["url"], 's', 4),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rotation_period": rotationPeriod,
        "orbital_period": orbitalPeriod,
        "diameter": diameter,
        "climate": climate,
        "gravity": gravity,
        "terrain": terrain,
        "surface_water": surfaceWater,
        "population": population,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
