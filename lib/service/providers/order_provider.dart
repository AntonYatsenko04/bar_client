import 'package:bar_client/service/models/order/order_request.dart';
import 'package:bar_client/service/models/order/order_response.dart';
import 'package:bar_client/service/models/order/update_order_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/src/constants/api_constants.dart';

part 'order_provider.g.dart';

@RestApi()
abstract class OrderProvider {
  factory OrderProvider(Dio dio, {String baseUrl}) = _OrderProvider;

  @GET(ApiConstants.order)
  Future<List<OrderResponse>> getOrders();

  @POST(ApiConstants.order)
  Future<void> createMenuItem(@Body() OrderRequest request);

  @DELETE('${ApiConstants.order}/{id}')
  Future<void> deleteMenuItem(@Path() int id);

  @PATCH('${ApiConstants.order}/{id}')
  Future<void> updateMenuItem(
    @Body() UpdateOrderRequest request,
    @Path() int id,
  );
}
