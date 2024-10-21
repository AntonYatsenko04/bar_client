import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core_ui/src/widgets/app_scaffold.dart';
import 'package:bar_client/core_ui/src/widgets/error_view.dart';
import 'package:bar_client/features/menu/list_menu/cubit/list_menu_cubit.dart';
import 'package:bar_client/features/menu/list_menu/ui/wigets/menu_card.dart';
import 'package:bar_client/service/models/menu/menu_item_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/src/constants/num_constants.dart';

class ListMenuFrom extends StatelessWidget {
  const ListMenuFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: LocaleKeys.menu_menu.tr(),
      child: BlocBuilder<ListMenuCubit, ListMenuState>(
        builder: (BuildContext context, ListMenuState state) {
          final ListMenuState currentState = state;
          switch (currentState) {
            case LoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ErrorState():
              return ErrorView(message: currentState.errorMessage.tr());
            case DataState():
              {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: NumConstants.maxCrossAxisExtent,
                  ),
                  itemCount: currentState.menuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final MenuItemModel item = currentState.menuItems[index];

                    return MenuCard(menuItemModel: item);
                  },
                );
              }
          }
        },
      ),
    );
  }
}
