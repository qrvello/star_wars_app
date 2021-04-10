import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/data/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';

class ListCharactersCubit extends Cubit<List<Character>> {
  ListCharactersCubit(this._apiRepository) : super([]);
  final ApiRepository _apiRepository;

  List<Character> _characters = [];
  List<Character> get characters => _characters;

  Future<void> init() async {
    final response =
        await _apiRepository.requestApi('https://swapi.dev/api/people/.json');

    final decodedData = json.decode(response.body);

    for (var item in decodedData['results']) {
      final Character pelicula = Character.fromJson(item);
      _characters.add(pelicula);
    }
    emit(_characters);
  }
}
