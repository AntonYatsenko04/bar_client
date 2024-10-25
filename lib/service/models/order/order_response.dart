import 'package:bar_client/service/models/order/order_item_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.freezed.dart';
part 'order_response.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    required int id,
    required int tableNumber,
    required int waiterId,
    required int price,
    required List<OrderItemResponse> orders,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
}
