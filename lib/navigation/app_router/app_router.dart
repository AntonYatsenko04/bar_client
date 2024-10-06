import 'package:auto_route/auto_route.dart';
import 'package:bar_client/navigation/app_router/app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen|Dialog,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/sign_in',
          page: SignInRoute.page,
        ),
        AutoRoute(
          path: '/sign_up',
          page: SignUpRoute.page,
        ),
      ];
}
