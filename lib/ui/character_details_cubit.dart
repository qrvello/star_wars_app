import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/data/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/models/planet.dart';

import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';
import 'package:star_wars_app/ui/utils.dart';

class CharacterDetailsCubit extends Cubit<Character> {
  final ApiRepository _apiRepository;

  final Character _character;

  CharacterDetailsCubit(this._apiRepository, this._character)
      : super(_character);

  Future<void> init() async {
    List<Starship> starships = [];

    List<Vehicle> vehicles = [];

    for (String item in _character.starships) {
      String url = convertUrl(item);

      final response = await _apiRepository.requestApi(url);

      Starship starship = starshipFromJson(response.body);

      starships.add(starship);
    }

    for (String item in _character.vehicles) {
      String url = convertUrl(item);

      final response = await _apiRepository.requestApi(url);

      Vehicle vehicle = vehicleFromJson(response.body);

      vehicles.add(vehicle);
    }

    if (_character.homeworld != null) {
      String url = convertUrl(_character.homeworld);

      final response = await _apiRepository.requestApi(url);

      Planet planet = planetFromJson(response.body);

      _character.homeworld = planet;
      emit(_character);
    }

    _character.starships = List.from(starships);
    _character.vehicles = List.from(vehicles);

    emit(_character);
  }
}
