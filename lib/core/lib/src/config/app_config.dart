import '../constants/api_constants.dart';

enum Flavor {
  prod,
  dev,
}

class AppConfig {
  final Flavor flavor;
  final String baseUrl;
  final String webSocketUrl;

  AppConfig({
    required this.flavor,
    required this.baseUrl,
    required this.webSocketUrl,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrl;
    String webSocketUrl;
    switch (flavor) {
      case Flavor.prod:
        baseUrl = ApiConstants.baseUrl;
        webSocketUrl = ApiConstants.webSocketUrl;
        break;

      case Flavor.dev:
        baseUrl = ApiConstants.baseUrl;
        webSocketUrl = ApiConstants.webSocketUrl;
        break;
    }

    return AppConfig(
      flavor: flavor,
      baseUrl: baseUrl,
      webSocketUrl: webSocketUrl,
    );
  }
}
