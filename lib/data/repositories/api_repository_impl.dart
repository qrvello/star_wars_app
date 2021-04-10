import 'dart:io';

import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:http/http.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<Response> requestApi(url) async {
    try {
      final Response result = await get(Uri.parse(url));

      return result;
    } on SocketException {
      throw SocketException;
    }
  }

  @override
  void submitReport() {
    // TODO: implement submitReport
  }
}
