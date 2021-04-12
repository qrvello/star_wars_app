import 'package:star_wars_app/domain/models/character.dart';

abstract class ApiRepository {
  Future<Map<String, dynamic>> getCharacters(url);

  Future<Character> getCharacterDetails(Character character);

  void submitReport();
}
