import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/repositories/database_repository.dart';
import 'character_details_state.dart';

class CharacterDetailsOnlineCubit extends Cubit<CharacterDetailsState> {
  final ApiRepository _apiRepository;
  final DatabaseRepository _databaseRepository;
  final Character _character;

  CharacterDetailsOnlineCubit(
      this._character, this._apiRepository, this._databaseRepository)
      : super(CharacterDetailsInitial());

  // Carga los detalles del personaje (naves, vehiculos y planeta al que pertenece)
  Future<void> init() async {
    CharacterDetailsLoading();
    try {
      Character character =
          await _apiRepository.getCharacterDetails(_character);

      await _databaseRepository.saveCharacterDetailsFromApi(character);

      emit(CharacterDetailsLoaded(character));
    } catch (_) {
      emit(CharacterDetailsError('Ha ocurrido un error'));
    }
  }
}
