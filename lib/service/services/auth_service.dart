import 'package:bar_client/service/models/auth/sign_in_model.dart';
import 'package:bar_client/service/models/auth/token_model.dart';
import 'package:bar_client/service/providers/auth_provider.dart';
import 'package:bar_client/service/providers/shared_preferences_provider.dart';
import 'package:bar_client/service/safe_request/safe_request.dart';

class AuthService {
  final AuthProvider _authProvider;
  final SharedPreferencesProvider _sharedPreferencesProvider;

  AuthService({
    required AuthProvider authProvider,
    required SharedPreferencesProvider sharedPreferencesProvider,
  })  : _authProvider = authProvider,
        _sharedPreferencesProvider = sharedPreferencesProvider;

  Future<void> signIn({required SignInModel signInModel}) async {
    final TokenModel token = await safeRequest<TokenModel>(() => _authProvider.signIn(signInModel));
    await _sharedPreferencesProvider.saveToken(token.token);
  }

  Future<void> signUp({required SignInModel signInModel}) async {
    await safeRequest(() => _authProvider.signUp(signInModel));
  }
}
