import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/models/planet.dart';
import 'package:star_wars_app/domain/models/starship.dart';
import 'package:star_wars_app/domain/models/vehicle.dart';

import 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  final ApiRepository _apiRepository;
  final Character _character;

  List<Starship> starships = [];
  List<Vehicle> vehicles = [];
  Planet homeworld;

  CharacterDetailsCubit(this._apiRepository, this._character)
      : super(CharacterDetailsInitial());

  // Carga los detalles del personaje (naves, vehiculos y planeta al que pertenece)

  Future<void> init() async {
    for (String url in _character.starships) {
      try {
        final response = await _apiRepository.requestApi(url);
        Starship starship = starshipFromJson(response.body);
        starships.add(starship);
      } catch (_) {
        emit(CharacterDetailsError(
            'Error al cargar los detalles del personaje'));
      }
    }

    for (String url in _character.vehicles) {
      try {
        final response = await _apiRepository.requestApi(url);
        Vehicle vehicle = vehicleFromJson(response.body);
        vehicles.add(vehicle);
      } catch (_) {
        emit(CharacterDetailsError(
            'Error al cargar los detalles del personaje'));
      }
    }

    if (_character.homeworld != null) {
      try {
        final response = await _apiRepository.requestApi(_character.homeworld);
        homeworld = planetFromJson(response.body);
      } catch (_) {
        emit(CharacterDetailsError(
            'Error al cargar los detalles del personaje'));
      }
    }

    if (state is! CharacterDetailsError) {
      emit(CharacterDetailsLoaded(homeworld, starships, vehicles));
    }
  }
}
