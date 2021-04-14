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
  //
  // Se encarga de realizar la peticion a la url que se le envía
  // por parámetro
  //
  Future<Map<String, dynamic>> getCharacters(url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      final Map<String, dynamic> decodedData = json.decode(response.body);

      return decodedData;
    } on SocketException {
      throw SocketException;
    }
  }

  //
  // Se encarga de realizar las peticiones a las url de los vehiculos, naves,
  // y del planeta proveniente del personaje.
  //
  Future<Character> getCharacterDetails(Character character) async {
    List<Starship> starships = [];
    List<Vehicle> vehicles = [];

    //
    // Se recorre las naves del personaje

    for (var starship in character.starships) {
      // Si es string se hace la petición de tipo GET
      if (starship is String) {
        try {
          final response = await http.get(Uri.parse(starship));

          // La respuesta se convierte a un objeto del tipo Starship
          Starship _starship = starshipFromJson(response.body);

          // Se agrega el objeto a la lista starships
          starships.add(_starship);
        } on SocketException {
          throw SocketException;
        }
      }
    }

    // Si la lista de starships contiene informacion
    // se remplazara la lista de naves del personaje por ésta

    if (starships.length > 0) {
      character.starships = List.from(starships);
    }

    //
    // Se recorren los vehiculos del personaje

    for (var vehicle in character.vehicles) {
      // Si es string se hace la petición de tipo GET
      if (vehicle is String) {
        try {
          final response = await http.get(Uri.parse(vehicle));

          // La respuesta se convierte a un objeto del tipo Vehicle
          Vehicle _vehicle = vehicleFromJson(response.body);

          // Se agrega el objeto a la lista vehicles
          vehicles.add(_vehicle);
        } on SocketException {
          throw SocketException;
        }
      }
    }

    // Si la lista de vehicles contiene informacion
    // se remplazara la lista de vehiculos del personaje por ésta

    if (vehicles.length > 0) {
      character.vehicles = List.from(vehicles);
    }

    //
    // Si el homeworld del personaje es de tipo String se realiza la petición
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

  //
  // Se encarga de enviar el reporte de avistamiento
  //
  @override
  Future<void> submitReport(Character character) async {
    try {
      final String url = 'https://jsonplaceholder.typicode.com/posts';

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll({
        'userId': '1',
        'dateTime': character.created.toString(),
        'character_name': character.name
      });

      await request.send();
    } on SocketException {
      throw SocketException;
    }
  }
}
