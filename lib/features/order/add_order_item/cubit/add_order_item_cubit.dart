import 'dart:math';

import 'package:bar_client/service/services/menu_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/src/logger/logger.dart';
import '../../../../service/exceptions/app_exception.dart';
import '../../../../service/models/menu/menu_item_response.dart';
import '../../../../service/services/order_service.dart';

part 'add_order_item_cubit.freezed.dart';
part 'add_order_item_state.dart';

class AddOrderItemCubit extends Cubit<AddOrderItemState> {
  final MenuService _menuService;
  final OrderService _orderService;

  AddOrderItemCubit({
    required MenuService menuService,
    required OrderService orderService,
  })  : _menuService = menuService,
        _orderService = orderService,
        super(const LoadingState()) {
    getMenuItems();
  }

  Future<void> getMenuItems() async {
    try {
      emit(const LoadingState());
      final List<MenuItemResponse> menuItems = await _menuService.getAllMenuItems();
      final Map<MenuItemResponse, int> map = <MenuItemResponse, int>{
        for (final MenuItemResponse item in menuItems) item: 0,
      };
      emit(DataState(menuToCountMap: map));
    } on AppException catch (e, st) {
      AppLogger().error(error: e, stackTrace: st);
      emit(ErrorState(errorMessage: e.errorMessageKey));
    }
  }

  Future<void> addSubOrder() async {
    final AddOrderItemState currentState = state;

    if (currentState is DataState) {
      try {
        final resultingOrders = currentState.menuToCountMap.entries;
        if (currentState.tableNumber == null) {}
        // _orderService.createOrder(OrderRequest(tableNumber: tableNumber, waiterId: waiterId, orderItems: orderItems))
      } on AppException catch (e, st) {
        AppLogger().error(error: e, stackTrace: st);
        emit(ErrorState(errorMessage: e.errorMessageKey));
      }
    }
  }

  void setTableNumber(int? tableNumber) {
    final AddOrderItemState currentState = state;

    if (currentState is DataState) {
      emit(
        currentState.copyWith(
          tableNumber: tableNumber,
        ),
      );
    }
  }

  void changeItemCount(
    MenuItemResponse item,
    bool add,
  ) {
    final AddOrderItemState currentState = state;

    if (currentState is DataState) {
      final List<MapEntry<MenuItemResponse, int>> oldEntries =
          currentState.menuToCountMap.entries.toList();

      final Map<MenuItemResponse, int> newEntries = <MenuItemResponse, int>{};

      for (int i = 0; i < oldEntries.length; i++) {
        final MapEntry<MenuItemResponse, int> oldEntry = oldEntries[i];
        final MapEntry<MenuItemResponse, int> newEntry;
        if (oldEntry.key == item) {
          newEntry = MapEntry(item, max(oldEntry.value + (add ? 1 : -1), 0));
        } else {
          newEntry = oldEntry;
        }
        newEntries.addEntries(<MapEntry<MenuItemResponse, int>>[newEntry]);
      }

      emit(currentState.copyWith(menuToCountMap: newEntries));
    }
  }
}
