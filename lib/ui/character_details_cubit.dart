import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/data/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/ui/utils.dart';

class CharacterDetailsCubit extends Cubit<Character> {
  final ApiRepository _apiRepository;

  final Character _character;

  CharacterDetailsCubit(this._apiRepository, this._character)
      : super(_character);

  Character get character => _character;

  Future<void> init() async {
    print(_character.name);
    for (var item in _character.starships) {
      String url = convertUrl(item);

      final response = await _apiRepository.requestApi(url);

      final decodedData = json.decode(response.body);

      print(decodedData);
    }
  }
}
