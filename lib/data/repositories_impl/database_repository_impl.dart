import 'package:hive/hive.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/models/planet.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';
import 'package:star_wars_app/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl extends DatabaseRepository {
  static List<Character> characters = [];

  Box<Character> charactersBox = Hive.box<Character>('characters');
  Box<Starship> starshipsBox = Hive.box<Starship>('starships');
  Box<Vehicle> vehiclesBox = Hive.box<Vehicle>('vehicles');
  Box<Planet> planetsBox = Hive.box<Planet>('planets');

  @override
  Future<List<Character>> getCharactersFromDatabase() async {
    charactersBox.values.forEach((character) => characters.add(character));
    return characters;
  }

  Future<Character> getCharacterDetailsFromDatabase(Character character) async {
    List<Starship> _starships = [];
    List<Vehicle> _vehicles = [];

    character.starships.forEach((starship) {
      if (starship is String) {
        Starship _starship = starshipsBox.get(starship);
        _starships.add(_starship);
      } else if (starship is Starship) {
        _starships.add(starship);
      }
    });

    character.starships = List.from(_starships);

    character.vehicles.forEach((vehicle) {
      if (vehicle is String) {
        Vehicle _vehicle = vehiclesBox.get(vehicle);
        _vehicles.add(_vehicle);
      } else if (vehicle is Vehicle) {
        _vehicles.add(vehicle);
      }
    });

    character.vehicles = List.from(_vehicles);

    if (character.homeworld is String) {
      Planet homeworld = planetsBox.get(character.homeworld);
      character.homeworld = homeworld;
    }
    return character;
  }

  Future<void> saveCharacterDetailsFromApi(Character character) async {
    if (character.homeworld is Planet) {
      // Si no se encuentra el planeta en la base de datos entonces la inserta
      if (!planetsBox.containsKey(character.homeworld.url)) {
        await planetsBox.put(character.homeworld.url, character.homeworld);
      }
    }

    character.starships.forEach((starship) async {
      if (starship is Starship) {
        // Si no se encuentra la nave en la base de datos entonces la inserta
        if (!starshipsBox.containsKey(starship.url)) {
          await starshipsBox.put(starship.url, starship);
        }
      }
    });

    character.vehicles.forEach((vehicle) async {
      if (vehicle is Vehicle) {
        // Si no se encuentra el vehiculo en la base de datos entonces la inserta
        if (!vehiclesBox.containsKey(vehicle.url)) {
          await vehiclesBox.put(vehicle.url, vehicle);
        }
      }
    });
  }

  Future<void> saveCharactersFromApi(List<Character> characters) async {
    characters.forEach((Character character) async {
      // Si no existe en la base de datos lo guarda
      if (!charactersBox.containsKey(character.url)) {
        await charactersBox.put(character.url, character);
      }
    });
  }
}
