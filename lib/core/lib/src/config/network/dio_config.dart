import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../../data/providers/shared_preferences_provider.dart';
import '../app_config.dart';
import 'interceptors/dio_log_interceptor.dart';

part 'interceptors/error_interceptor.dart';
part 'interceptors/request_interceptor.dart';
part 'interceptors/response_interceptor.dart';

class DioConfig {
  final AppConfig _appConfig;
  final SharedPreferencesProvider _sharedPreferencesProvider;

  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioConfig({
    required AppConfig appConfig,
    required SharedPreferencesProvider sharedPreferencesProvider,
  })  : _appConfig = appConfig,
        _sharedPreferencesProvider = sharedPreferencesProvider {
    _dio
      ..options.extra['withCredentials'] = true
      ..options.baseUrl = _appConfig.baseUrl
      ..options.receiveDataWhenStatusError = true
      ..options.responseType = ResponseType.json
      ..options.headers.addAll(
        <String, dynamic>{
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET,PUT,PATCH,POST,DELETE',
          'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept',
          'Content-Type': 'application/json; charset=UTF-8',
          Headers.acceptHeader: Headers.jsonContentType,
        },
      )
      ..interceptors.addAll(
        <Interceptor>[
          RequestInterceptor(
            dio: _dio,
            sharedPreferencesProvider: _sharedPreferencesProvider,
          ),
          ErrorInterceptor(
            dio: _dio,
            sharedPreferencesProvider: _sharedPreferencesProvider,
          ),
          ResponseInterceptor(_dio),
          dioLoggerInterceptor,
        ],
      );
  }
}
