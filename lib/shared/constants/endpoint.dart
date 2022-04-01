import 'config.dart';

enum Endpoints {
  characters,
  episodes,
}

extension EndpointsExtension on Endpoints {
  String get scheme {
    return Config.baseScheme.value;
  }

  String get hostName {
    return Config.baseUrl.value;
  }

  String getPath(List<String>? params) {
    switch (this) {
      case Endpoints.characters:
        return '${Config.baseAPIpath.value}/character';
      case Endpoints.episodes:
        return '${Config.baseAPIpath.value}/episode';
    }
  }

  String buildURL({
    Map<String, dynamic>? queryParameters,
    List<String>? urlParams,
  }) {
    return Uri.https(
      hostName,
      getPath(urlParams),
      queryParameters,
    ).toString();
  }
}
