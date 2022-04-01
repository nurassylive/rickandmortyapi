enum Config { baseUrl, baseScheme, baseAPIpath }

const bool isDev = false;

extension ConfigExtension on Config {
  String get value {
    switch (this) {
      case Config.baseUrl:
        return 'rickandmortyapi.com';
      case Config.baseAPIpath:
        return 'api';
      default:
        return 'https';
    }
  }

  static String buildURLHead() {
    return Config.baseScheme.value + "://" + Config.baseUrl.value + '/';
  }
}
