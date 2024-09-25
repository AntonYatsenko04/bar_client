import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesProvider({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  Future<void> clearPrefs() async {
    await _sharedPreferences.clear();
  }

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _sharedPreferences.setString(_accessTokenKey, accessToken);
    await _sharedPreferences.setString(_refreshTokenKey, refreshToken);
  }

  Future<void> refreshAccessToken(String accessToken) async {
    await _sharedPreferences.setString(_accessTokenKey, accessToken);
  }

  Future<String?> getAccessToken() async {
    final String? accessToken = _sharedPreferences.getString(_accessTokenKey);
    return accessToken;
  }

  Future<String?> getRefreshToken() async {
    final String? refreshToken = _sharedPreferences.getString(_refreshTokenKey);
    return refreshToken;
  }
}
