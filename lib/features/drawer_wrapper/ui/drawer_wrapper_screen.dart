import 'package:auto_route/auto_route.dart';
import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/navigation/app_router/app_router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DrawerWrapperScreen extends StatelessWidget {
  const DrawerWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        BroadcastListRoute(),
        ListMenuRoute(),
      ],
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: LocaleKeys.broadcast_broadcastList.tr(),
                icon: const Icon(Icons.broadcast_on_home_sharp)),
            BottomNavigationBarItem(
              label: LocaleKeys.menu_menu.tr(),
              icon: const Icon(Icons.menu_book),
            ),
          ],
        );
      },
    );
  }
}
