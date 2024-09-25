import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

Future<void> safeRequest<T>(Future<dynamic> Function() request) async {
  const int clientError = 400;
  const int notFoundError = 404;
  const int unAuthError = 401;
  const int serverError = 500;

  try {
    return await request();
  } on DioException catch (error) {
    log(error.toString());
    final Response<dynamic>? response = error.response;
    log(response.toString());

    //   if (response == null) {
    //     throw AppException(
    //       errorMessage: 'exceptions.noInternetConnection'.tr(),
    //       code: AppExceptionCode.noInternetConnection,
    //     );
    //   } else {
    //     final int? statusCode = response.statusCode;
    //     if (statusCode != null) {
    //       if (statusCode == clientError || statusCode == notFoundError) {
    //         final Map<String, dynamic> map = response.data as Map<String, dynamic>;
    //         final String? commonError = map['title'] as String?;
    //         if (commonError != null) {
    //           throw AppException.unknown(errorMessage: getCustomError(map));
    //         } else {
    //           final String? error = map['message'];
    //           if (error != null) {
    //             throw AppException.unknown(errorMessage: getCustomError(map));
    //           } else {
    //             throw AppException(
    //               errorMessage: getCustomError(map),
    //               code: AppExceptionCode.badRequest,
    //             );
    //           }
    //         }
    //       }
    //       if (statusCode == unAuthError) {
    //         final Map<String, dynamic> map = response.data as Map<String, dynamic>;
    //         final String? error = map['detail'] as String?;
    //         if (error == StringConstants.credentialsErrorMessage) {
    //           throw const AppException.unknown(
    //             errorMessage: 'The email address or password is incorrect. Please, try again.',
    //           );
    //         } else if (error == StringConstants.notFoundErrorMessage) {
    //           throw const AppException.unknown(
    //             errorMessage: 'The email address is incorrect. Please, try again.',
    //           );
    //         }
    //         await appLocator<SharedPreferencesProvider>().clearPrefs();
    //       }
    //       if (statusCode >= serverError) {
    //         throw const AppException(
    //           errorMessage: 'The server is unavailable',
    //           code: AppExceptionCode.serverNotAvailable,
    //         );
    //       }
    //     }
    //
    //     throw AppException.unknown(errorMessage: getCustomError(error.response?.data));
    //   }
    // } catch (error, stackTrace) {
    //   log(error.toString(), stackTrace: stackTrace);
    //   throw Exception(error.toString());
    // }
    return;
  }

  String? getCustomError(Map<String, dynamic> json) {
    for (final String key in json.keys) {
      if (json[key] is List && json[key].length == 1 && json[key][0] is String) {
        return json[key][0];
      } else if (json[key] is String) {
        return json.values.first;
      }
    }
    return null;
  }
}
