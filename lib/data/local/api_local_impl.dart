import 'package:star_wars_app/data/api_repository.dart';
import 'package:http/http.dart';

class ApiLocalImpl extends ApiRepository {
  @override
  Future<Response> requestApi(url) async {
    final result = await get(Uri.parse(url));

    return result;
  }

  @override
  void submitReport() {
    // TODO: implement submitReport
  }
}
