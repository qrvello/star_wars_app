import 'package:star_wars_app/domain/models/planet.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';

abstract class CharacterDetailsState {
  const CharacterDetailsState();
}

class CharacterDetailsInitial extends CharacterDetailsState {
  const CharacterDetailsInitial();
}

class CharacterDetailsError extends CharacterDetailsState {
  final String message;

  CharacterDetailsError(this.message);
}

class CharacterDetailsLoaded extends CharacterDetailsState {
  CharacterDetailsLoaded(this.homeworld, this.starships, this.vehicles);
  final List<Starship> starships;
  final List<Vehicle> vehicles;
  final Planet homeworld;
}
