import 'package:bar_client/core/src/enums/order_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_request.freezed.dart';
part 'order_item_request.g.dart';

@freezed
class OrderItemRequest with _$OrderItemRequest {
  const factory OrderItemRequest({
    required List<int> menuItemIds,
    @JsonKey(
      toJson: _statusToJson,
      fromJson: _statusFromJson,
    )
    required OrderStatus status,
    int? cookId,
  }) = _OrderItemRequest;

  factory OrderItemRequest.fromJson(Map<String, dynamic> json) => _$OrderItemRequestFromJson(json);

  static String _statusToJson(OrderStatus status) => status.apiCode;

  static OrderStatus _statusFromJson(String apiCode) => OrderStatus.statusByApiCode(apiCode);
}
