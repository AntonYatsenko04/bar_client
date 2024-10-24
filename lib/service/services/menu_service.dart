import 'package:bar_client/service/models/menu/menu_item_request.dart';
import 'package:bar_client/service/models/menu/menu_item_response.dart';
import 'package:bar_client/service/providers/menu_provider.dart';
import 'package:bar_client/service/safe_request/safe_request.dart';

class MenuService {
  final MenuProvider _menuProvider;

  MenuService({
    required MenuProvider menuProvider,
  }) : _menuProvider = menuProvider;

  Future<List<MenuItemResponse>> getAllMenuItems() async {
    return safeRequest<List<MenuItemResponse>>(_menuProvider.getMenuItems);
  }

  Future<void> createMenuItem({required MenuItemRequest menuItem}) async {
    return safeRequest(() => _menuProvider.createMenuItem(menuItem));
  }

  Future<void> updateMenuItem({required MenuItemRequest menuItem}) async {
    return safeRequest(() => _menuProvider.updateMenuItem(menuItem));
  }

  Future<void> deleteMenuItem({required int id}) async {
    return safeRequest(() => _menuProvider.deleteMenuItem(id));
  }
}
