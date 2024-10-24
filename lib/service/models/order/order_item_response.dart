import 'package:bar_client/core/src/enums/order_status.dart';
import 'package:bar_client/service/models/menu/menu_item_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_response.freezed.dart';
part 'order_item_response.g.dart';

@freezed
class OrderItemResponse with _$OrderItemResponse {
  const factory OrderItemResponse({
    required List<MenuItemResponse> menuItems,
    required int tableNumber,
    required int price,
    required int waiterId,
    required OrderStatus status,
    int? cookId,
  }) = _OrderItemResponse;

  factory OrderItemResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderItemResponseFromJson(json);
}
