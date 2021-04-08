import 'package:http/http.dart';

abstract class ApiRepository {
  Future<Response> getCharacters();

  void submitReport();
}
