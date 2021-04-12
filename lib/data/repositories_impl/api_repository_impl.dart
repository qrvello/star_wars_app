import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/models/planet.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<Map<String, dynamic>> getCharacters(url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      final Map<String, dynamic> decodedData = json.decode(response.body);

      return decodedData;
    } on SocketException {
      throw SocketException;
    }
  }

  Future<Character> getCharacterDetails(Character character) async {
    List<Starship> starships = [];
    List<Vehicle> vehicles = [];

    for (String url in character.starships) {
      try {
        final response = await http.get(Uri.parse(url));

        Starship starship = starshipFromJson(response.body);

        starships.add(starship);
      } on SocketException {
        throw SocketException;
      }

      character.starships = starships;
    }

    for (String url in character.vehicles) {
      try {
        final response = await http.get(Uri.parse(url));

        Vehicle vehicle = vehicleFromJson(response.body);

        vehicles.add(vehicle);
      } on SocketException {
        throw SocketException;
      }
      character.vehicles = vehicles;
    }

    if (character.homeworld != null) {
      try {
        final response = await http.get(Uri.parse(character.homeworld));

        character.homeworld = planetFromJson(response.body);
      } on SocketException {
        throw SocketException;
      }
    }

    return character;
  }

  @override
  void submitReport() {
    // TODO: implement submitReport
  }
}
