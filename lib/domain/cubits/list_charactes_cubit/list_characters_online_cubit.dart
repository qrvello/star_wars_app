import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/repositories/database_repository.dart';

import 'list_characters_state.dart';

class ListCharactersOnlineCubit extends Cubit<ListCharactersState> {
  ListCharactersOnlineCubit(this._apiRepository, this._databaseRepository)
      : super(ListCharactersInitial());

  final ApiRepository _apiRepository;
  final DatabaseRepository _databaseRepository;

  List<Character> characters = [];

  String nextUrl = '';

  String previousUrl = '';

  Future<void> init({String url = 'https://swapi.dev/api/people/.json'}) async {
    emit(ListCharactersLoading());

    characters.clear();

    final Map<String, dynamic> decodedData =
        await _apiRepository.getCharacters(url);

    for (var item in decodedData['results']) {
      final Character character = Character.fromJson(item);

      characters.add(character);
    }

    if (decodedData['next'] != null) {
      // Convierte la url en HTTPS
      nextUrl = StringUtils.addCharAtPosition(decodedData['next'], 's', 4);
    } else {
      nextUrl = '';
    }

    if (decodedData['previous'] != null) {
      // Convierte la url en HTTPS
      previousUrl =
          StringUtils.addCharAtPosition(decodedData['previous'], 's', 4);
    } else {
      previousUrl = '';
    }

    if (characters.length > 0) {
      await _databaseRepository.saveCharactersFromApi(characters);

      emit(ListCharactersLoaded(characters,
          nextUrl: nextUrl, previousUrl: previousUrl));
    } else {
      emit(ListCharactersError('Error al cargar los personajes'));
    }
  }
}
