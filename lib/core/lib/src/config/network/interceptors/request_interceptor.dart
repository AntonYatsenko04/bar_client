part of '../dio_config.dart';

class RequestInterceptor extends Interceptor {
  final Dio _dio;
  final SharedPreferencesProvider _sharedPreferencesProvider;

  RequestInterceptor({
    required Dio dio,
    required SharedPreferencesProvider sharedPreferencesProvider,
  })  : _dio = dio,
        _sharedPreferencesProvider = sharedPreferencesProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? accessToken =
        await _sharedPreferencesProvider.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }
}
