import 'package:bar_client/service/providers/auth_provider.dart';
import 'package:bar_client/service/providers/broadcast_provider.dart';
import 'package:bar_client/service/providers/shared_preferences_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void initProviderDi(GetIt appLocator) {
  appLocator
    ..registerLazySingleton<SharedPreferencesProvider>(
      () => SharedPreferencesProvider(
        sharedPreferences: appLocator(),
      ),
    )
    ..registerLazySingleton<AuthProvider>(
      () => AuthProvider(
        appLocator<Dio>(),
      ),
    )
    ..registerLazySingleton<BroadcastProvider>(
      () => BroadcastProvider(
        appLocator<Dio>(),
      ),
    );
}
