import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesProvider({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static const String _accessTokenKey = 'accessToken';

  Future<void> clearPrefs() async {
    await _sharedPreferences.clear();
  }

  Future<void> saveToken(String token) async {
    await _sharedPreferences.setString(_accessTokenKey, token);
  }

  String? getToken() {
    return _sharedPreferences.getString(_accessTokenKey);
  }
}
