import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/repositories/database_repository.dart';

import 'list_characters_state.dart';

class ListCharactersOfflineCubit extends Cubit<ListCharactersState> {
  ListCharactersOfflineCubit(this.databaseRepository)
      : super(ListCharactersInitial());

  final DatabaseRepository databaseRepository;

  List<Character> characters = [];

  Future<void> init() async {
    emit(ListCharactersLoading());

    characters = await databaseRepository.getCharactersFromDatabase();

    emit(ListCharactersLoaded(characters));
  }
}
