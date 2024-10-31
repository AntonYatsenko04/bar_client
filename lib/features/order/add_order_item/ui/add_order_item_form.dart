import 'package:bar_client/features/order/add_order_item/cubit/add_order_item_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/src/constants/num_constants.dart';
import '../../../../core/src/localization/generated/locale_keys.g.dart';
import '../../../../core_ui/src/widgets/app_scaffold.dart';
import '../../../../core_ui/src/widgets/error_view.dart';
import '../../../../core_ui/src/widgets/menu_card.dart';
import '../../../../service/models/menu/menu_item_response.dart';

class AddOrderItemForm extends StatelessWidget {
  const AddOrderItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrderItemCubit, AddOrderItemState>(
      builder: (BuildContext context, AddOrderItemState state) {
        final AddOrderItemState currentState = state;
        final AddOrderItemCubit cubit = context.read<AddOrderItemCubit>();
        return AppScaffold(
          title: LocaleKeys.order_addOrderItem.tr(),
          floatingActionButton:
              ElevatedButton(onPressed: () {}, child: Text(LocaleKeys.order_addOrderItem.tr())),
          actions: <Widget>[
            DropdownMenu<int>(
              onSelected: cubit.setTableNumber,
              dropdownMenuEntries: List.generate(
                10,
                (int index) => DropdownMenuEntry(
                  value: index + 1,
                  label: (index + 1).toString(),
                ),
              ),
            )
          ],
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
                      itemCount: currentState.menuToCountMap.length,
                      itemBuilder: (BuildContext context, int index) {
                        final MenuItemResponse item =
                            currentState.menuToCountMap.keys.toList()[index];

                        return MenuCard(
                          menuItemModel: item,
                          actions: <Widget>[
                            IconButton(
                              onPressed: () {
                                cubit.changeItemCount(item, false);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text(currentState.menuToCountMap.values.toList()[index].toString()),
                            IconButton(
                              onPressed: () {
                                cubit.changeItemCount(item, true);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
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
