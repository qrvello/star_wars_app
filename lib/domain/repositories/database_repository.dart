import 'package:star_wars_app/domain/models/character.dart';

abstract class DatabaseRepository {
  Future<void> saveCharactersFromApi(List<Character> characters);

  Future<void> saveCharacterDetailsFromApi(Character character);

  Future<List<Character>> getCharactersFromDatabase();

  Future<Character> getCharacterDetailsFromDatabase(Character character);
}
