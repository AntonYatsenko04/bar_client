import 'package:bar_client/service/services/auth_service.dart';
import 'package:bar_client/service/services/broadcast_service.dart';
import 'package:bar_client/service/services/menu_service.dart';
import 'package:get_it/get_it.dart';

void initServiceDi(GetIt appLocator) {
  appLocator
    ..registerLazySingleton<AuthService>(
      () => AuthService(
        authProvider: appLocator(),
        sharedPreferencesProvider: appLocator(),
      ),
    )
    ..registerLazySingleton<BroadcastService>(
      () => BroadcastService(
        broadcastProvider: appLocator(),
      ),
    )
    ..registerLazySingleton<MenuService>(
      () => MenuService(
        menuProvider: appLocator(),
      ),
    );
}
