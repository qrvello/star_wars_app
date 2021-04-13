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

    character.starships.forEach((_starship) async {
      if (_starship is String) {
        try {
          final response = await http.get(Uri.parse(_starship));

          Starship starship = starshipFromJson(response.body);

          starships.add(starship);
        } on SocketException {
          throw SocketException;
        }
      } else if (_starship is Starship) {
        starships.add(_starship);
      }
    });

    character.starships = starships;

    character.vehicles.forEach((_vehicle) async {
      if (_vehicle is String) {
        try {
          final response = await http.get(Uri.parse(_vehicle));

          Vehicle vehicle = vehicleFromJson(response.body);

          vehicles.add(vehicle);
        } on SocketException {
          throw SocketException;
        }
      } else if (_vehicle is Vehicle) {
        vehicles.add(_vehicle);
      }
      character.vehicles = vehicles;
    });

    if (character.homeworld is String) {
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
  Future<void> submitReport(Character character) async {
    try {
      final String url = 'https://jsonplaceholder.typicode.com/posts';

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll({
        'userId': '1',
        'dateTime': 'rgergegr',
        'character_name': 'Luke Skywalker'
      });

      await request.send();
    } on SocketException {
      throw SocketException;
    }
  }
}
