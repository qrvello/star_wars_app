import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/repositories/database_repository.dart';
import 'character_details_state.dart';

class CharacterDetailsOfflineCubit extends Cubit<CharacterDetailsState> {
  final DatabaseRepository _databaseRepository;
  final Character _character;

  CharacterDetailsOfflineCubit(
    this._character,
    this._databaseRepository,
  ) : super(CharacterDetailsInitial());

  // Carga los detalles del personaje (naves, vehiculos y planeta al que pertenece)

  Future<void> init() async {
    emit(CharacterDetailsLoading());
    try {
      Character character =
          await _databaseRepository.getCharacterDetailsFromDatabase(_character);

      emit(CharacterDetailsLoaded(character));
    } catch (_) {
      emit(CharacterDetailsError('Error al obtener datos de la base de datos'));
    }
  }
}
