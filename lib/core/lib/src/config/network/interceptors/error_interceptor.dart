part of '../dio_config.dart';

class ErrorInterceptor extends Interceptor {
  final Dio _dio;
  final SharedPreferencesProvider _sharedPreferencesProvider;

  ErrorInterceptor({
    required Dio dio,
    required SharedPreferencesProvider sharedPreferencesProvider,
  })  : _dio = dio,
        _sharedPreferencesProvider = sharedPreferencesProvider;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // const int errorStatusCodeServerError = 500;
    // const int notAuthorizedErrorCode = 401;
    // const int forbiddenErrorCode = 403;
    // const int errorStatusCodeNotFound = 404;
    // final int? errorStatusCode = err.response?.statusCode;
    //
    // if (errorStatusCode != null) {
    //   if (errorStatusCode == errorStatusCodeServerError ||
    //       errorStatusCode == forbiddenErrorCode) {
    //     handler.next(err);
    //   } else if (errorStatusCode == errorStatusCodeNotFound) {
    //     handler.next(err);
    //   } else if (errorStatusCode == notAuthorizedErrorCode) {
    //     final Map<String, dynamic> map =
    //         err.response?.data as Map<String, dynamic>;
    //     final String? error = map['detail'] as String?;
    //     if (error == StringConstants.credentialsErrorMessage ||
    //         error == StringConstants.notFoundErrorMessage) {
    //       handler.next(err);
    //     } else {
    //       final Map<String, dynamic> headers = err.requestOptions.headers;
    //       final String? refreshToken =
    //           await _sharedPreferencesProvider.getRefreshToken();
    //
    //       if (refreshToken != null) {
    //         if (JwtDecoder.isExpired(refreshToken)) {
    //           await _logOut();
    //           handler.next(err);
    //         } else {
    //           try {
    //             final AccessTokenEntity responseData =
    //                 await appLocator<AuthApiProvider>().refreshToken(
    //               RefreshTokenRequest(refreshToken: refreshToken),
    //             );
    //
    //             await _sharedPreferencesProvider
    //                 .refreshAccessToken(responseData.accessToken);
    //
    //             final String? accessToken =
    //                 await _sharedPreferencesProvider.getAccessToken();
    //             headers['Authorization'] = 'Bearer $accessToken';
    //
    //             final Options newOptions = Options(
    //               method: err.requestOptions.method,
    //               headers: headers,
    //             );
    //
    //             if (err.requestOptions.data is FormData) {
    //               FormData requestData = err.requestOptions.data;
    //               final FormData newRequestData = FormData();
    //
    //               final Directory appDocDir =
    //                   await getApplicationDocumentsDirectory();
    //
    //               final files = err.requestOptions.data.files;
    //               for (final element in files) {
    //                 newRequestData.files.add(
    //                   MapEntry(
    //                     element.key,
    //                     MultipartFile.fromFileSync(
    //                       '${appDocDir.path}/${element.value.filename!}',
    //                       filename: element.value.filename,
    //                     ),
    //                   ),
    //                 );
    //               }
    //
    //               final List<MapEntry<String, String>> fields =
    //                   requestData.fields;
    //               for (final MapEntry<String, String> element in fields) {
    //                 newRequestData.fields.add(
    //                   MapEntry(element.key, element.value),
    //                 );
    //               }
    //
    //               requestData = newRequestData;
    //             }
    //
    //             final Response<dynamic> newResponse = await _dio.request(
    //               err.requestOptions.path,
    //               data: err.requestOptions.data,
    //               queryParameters: err.requestOptions.queryParameters,
    //               options: newOptions,
    //             );
    //             handler.resolve(newResponse);
    //           } on DioException catch (err) {
    //             handler.next(err);
    //           }
    //         }
    //       } else {
    //         handler.next(err);
    //       }
    //     }
    //   } else {
    //     handler.next(err);
    //   }
    // } else {
    //   handler.next(err);
    // }
  }

  Future<void> _logOut() async {
    // await _sharedPreferencesProvider.clearPrefs();
    // unawaited(appLocator<AppRouter>().replace(const SignInRoute()));
  }
}
