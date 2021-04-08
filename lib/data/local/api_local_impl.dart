import 'package:star_wars_app/data/api_repository.dart';
import 'package:http/http.dart';

class ApiLocalImpl extends ApiRepository {
  @override
  Future<Response> getCharacters() async {
    final result = await get(Uri.parse('https://swapi.dev/api/people/.json'));

    return result;
  }

  @override
  void submitReport() {
    // TODO: implement submitReport
  }
}
