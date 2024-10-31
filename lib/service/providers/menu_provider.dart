import 'package:bar_client/core/src/constants/api_constants.dart';
import 'package:bar_client/service/models/menu/menu_item_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/menu/menu_item_request.dart';

part 'menu_provider.g.dart';

@RestApi()
abstract class MenuProvider {
  factory MenuProvider(Dio dio, {String baseUrl}) = _MenuProvider;

  @GET(ApiConstants.menu)
  Future<List<MenuItemResponse>> getMenuItems();

  @POST(ApiConstants.menu)
  Future<void> createMenuItem(@Body() MenuItemRequest request);

  @DELETE('${ApiConstants.menu}/{id}')
  Future<void> deleteMenuItem(@Path() int id);

  @PATCH('${ApiConstants.menu}/{id}')
  Future<void> updateMenuItem(
    @Body() MenuItemRequest request,
    @Path() int id,
  );
}

class MockMenuProvider implements MenuProvider {
  @override
  Future<void> createMenuItem(MenuItemRequest request) async {
    return;
  }

  @override
  Future<void> deleteMenuItem(int id) async {
    return;
  }

  @override
  Future<List<MenuItemResponse>> getMenuItems() async {
    final mockMenuItem1 = MenuItemResponse(
      id: 1,
      name: 'Пицца Маргарита',
      description: 'Классическая пицца Маргарита с свежими помидорами, моцареллой и базиликом.',
      price: 999,
    );

    final mockMenuItem2 = MenuItemResponse(
      id: 2,
      name: 'Спагетти Болоньезе',
      description: 'Традиционные итальянские спагетти с насыщенным и ароматным соусом Болоньезе.',
      price: 1299,
    );

    final mockMenuItem3 = MenuItemResponse(
      id: 3,
      name: 'Салат Цезарь',
      description: 'Хрустящий салат ромэн с соусом Цезарь, сухариками и пармезаном.',
      price: 799,
    );

    final mockMenuItem4 = MenuItemResponse(
      id: 4,
      name: 'Сэндвич с жареной курицей',
      description:
          'Сочный сэндвич с жареной курицей на поджаренной булочке с листьями салата и помидором.',
      price: 1099,
    );

    final mockMenuItems = [
      mockMenuItem1,
      mockMenuItem2,
      mockMenuItem3,
      mockMenuItem4,
    ];
    return mockMenuItems;
  }

  @override
  Future<void> updateMenuItem(MenuItemRequest request, int id) async {
    return;
  }
}
