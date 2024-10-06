sealed class UrlConstants {
  static const String _playMarketUrl =
      'https://play.google.com/store/apps/details?id=';
  static const String _appStoreUrlIOS = 'https://apps.apple.com/app/id';
  static const String _iosAppId = '6479399669';
  static const String _androidAppId = 'com.personalhealthconnectllc.phc';

  static const String appPlayMarketUrl = '$_playMarketUrl$_androidAppId';
  static const String appAppStoreUrl = '$_appStoreUrlIOS$_iosAppId';
}
