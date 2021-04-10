import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';

import 'list_characters_state.dart';

class ListCharactersCubit extends Cubit<ListCharactersState> {
  ListCharactersCubit(this._apiRepository) : super(ListCharactersInitial());

  final ApiRepository _apiRepository;

  List<Character> characters = [];

  String nextUrl = '';

  String previousUrl = '';

  Future<void> init(String url) async {
    try {
      emit(ListCharactersLoading());

      characters.clear();

      final response = await _apiRepository.requestApi(url);

      final decodedData = json.decode(response.body);

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
        emit(ListCharactersLoaded(characters, nextUrl, previousUrl));
      } else {
        emit(ListCharactersError('Error al cargar los personajes'));
      }
    } catch (_) {
      emit(ListCharactersError('Error al cargar los personajes'));
    }
  }
}
