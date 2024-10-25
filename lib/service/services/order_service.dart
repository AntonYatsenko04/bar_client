import 'package:bar_client/service/models/order/order_request.dart';
import 'package:bar_client/service/providers/order_provider.dart';
import 'package:bar_client/service/safe_request/safe_request.dart';

import '../models/order/order_response.dart';

class OrderService {
  final OrderProvider _orderProvider;

  OrderService({
    required OrderProvider orderProvider,
  }) : _orderProvider = orderProvider;

  Future<List<OrderResponse>> getOrders() {
    return safeRequest(_orderProvider.getOrders);
  }

  Future<void> createOrder(OrderRequest order) async {
    return safeRequest(() => _orderProvider.createMenuItem(order));
  }

  Future<void> updateOrder(
    OrderRequest order,
    int id,
  ) async {}

  Future<void> deleteOrder(int id) async {}
}
