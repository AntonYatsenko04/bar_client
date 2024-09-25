
part of localization;

class AppLocalization {
  static const String langsFolderPath = 'core/resources/translations';
  static List<Locale> get supportedLocales => <Locale>[_enLocale];

  static Locale get fallbackLocale => _enLocale;
  static const Locale _enLocale = Locale('en', 'US');

}
