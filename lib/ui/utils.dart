// Convierte url http a https

convertUrl(String _url) {
  List<String> urlSeparated = _url.split(":");

  String url = 'https:' + urlSeparated[1];

  return url;
}
