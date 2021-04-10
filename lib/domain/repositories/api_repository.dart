import 'package:http/http.dart';

abstract class ApiRepository {
  Future<Response> requestApi(url);

  void submitReport();
}
