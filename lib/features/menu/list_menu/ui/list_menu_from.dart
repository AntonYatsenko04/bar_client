import 'dart:async';

import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core_ui/src/widgets/app_scaffold.dart';
import 'package:bar_client/core_ui/src/widgets/error_view.dart';
import 'package:bar_client/features/menu/edit_menu/ui/edit_menu_screen.dart';
import 'package:bar_client/features/menu/list_menu/cubit/list_menu_cubit.dart';
import 'package:bar_client/features/menu/list_menu/ui/widget/menu_card.dart';
import 'package:bar_client/service/models/menu/menu_item_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/src/constants/num_constants.dart';

class ListMenuFrom extends StatelessWidget {
  const ListMenuFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListMenuCubit, ListMenuState>(
      builder: (BuildContext context, ListMenuState state) {
        final ListMenuState currentState = state;
        final ListMenuCubit cubit = context.read<ListMenuCubit>();
        return AppScaffold(
          title: LocaleKeys.menu_menu.tr(),
          leading: IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (_) {
                  return const EditMenuScreen();
                },
              );
              unawaited(cubit.getMenuItems());
            },
            icon: const Icon(Icons.add),
          ),
          child: Builder(
            builder: (_) {
              switch (currentState) {
                case LoadingState():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ErrorState():
                  return Center(
                    child: ErrorView(message: currentState.errorMessage.tr()),
                  );
                case DataState():
                  {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: NumConstants.maxCrossAxisExtent + 100,
                      ),
                      itemCount: currentState.menuItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final MenuItemResponse item = currentState.menuItems[index];

                        return MenuCard(
                          menuItemModel: item,
                          deleteCallback: () => cubit.deleteMenuItem(item.id),
                          editCallback: () async {
                            await showDialog(
                              context: context,
                              builder: (_) {
                                return EditMenuScreen(
                                  menuItem: item,
                                );
                              },
                            );
                            await cubit.getMenuItems();
                          },
                        );
                      },
                    );
                  }
              }
            },
          ),
        );
      },
    );
  }
}
