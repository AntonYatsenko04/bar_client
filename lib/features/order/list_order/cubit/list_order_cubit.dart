import 'package:bar_client/core/src/logger/logger.dart';
import 'package:bar_client/service/models/order/order_response.dart';
import 'package:bar_client/service/services/order_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../service/exceptions/app_exception.dart';

part 'list_order_cubit.freezed.dart';
part 'list_order_state.dart';

class ListOrderCubit extends Cubit<ListOrderState> {
  final OrderService _orderService;

  ListOrderCubit({
    required OrderService orderService,
  })  : _orderService = orderService,
        super(const LoadingState());

  Future<void> getOrders() async {
    try {
      emit(const LoadingState());
      final List<OrderResponse> orders = await _orderService.getOrders();
      emit(DataState(orders: orders));
    } on AppException catch (e, st) {
      AppLogger().error(error: e, stackTrace: st);
      emit(ErrorState(errorMessage: e.errorMessageKey));
    }
  }

  Future<void> deleteOrders(int id) async {
    try {
      emit(const LoadingState());
      await _orderService.deleteOrder(id);
      await getOrders();
    } on AppException catch (e, st) {
      AppLogger().error(error: e, stackTrace: st);
      emit(ErrorState(errorMessage: e.errorMessageKey));
    }
  }
}
