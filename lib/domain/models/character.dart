// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  dynamic homeworld;
  List<dynamic> films;
  List<dynamic> species;
  List<dynamic> vehicles;
  List<dynamic> starships;
  DateTime created;
  DateTime edited;
  String url;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        // Convierte las URL en https
        homeworld: StringUtils.addCharAtPosition(json["homeworld"], 's', 4),
        films: List<String>.from(
            json["films"].map((x) => StringUtils.addCharAtPosition(x, 's', 4))),
        species: List<String>.from(json["species"]
            .map((x) => StringUtils.addCharAtPosition(x, 's', 4))),
        vehicles: List<String>.from(json["vehicles"]
            .map((x) => StringUtils.addCharAtPosition(x, 's', 4))),
        starships: List<String>.from(json["starships"]
            .map((x) => StringUtils.addCharAtPosition(x, 's', 4))),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": gender,
        "homeworld": homeworld,
        "films": List<dynamic>.from(films.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
