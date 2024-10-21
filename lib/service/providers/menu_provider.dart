import 'package:bar_client/core/src/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/menu/menu_item_model.dart';

part 'menu_provider.g.dart';

@RestApi()
abstract class MenuProvider {
  factory MenuProvider(Dio dio, {String baseUrl}) = _MenuProvider;

  @GET(ApiConstants.menu)
  Future<List<MenuItemModel>> getMenuItems();

  @POST(ApiConstants.menu)
  Future<void> createMenuItem(@Body() MenuItemModel request);

  @DELETE(ApiConstants.menu)
  Future<void> deleteMenuItem(@Body() int id);

  @PATCH(ApiConstants.menu)
  Future<void> updateMenuItem(
    @Body() MenuItemModel request,
  );
}
