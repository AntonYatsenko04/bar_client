import 'package:bar_client/service/models/menu/menu_item_model.dart';
import 'package:bar_client/service/providers/menu_provider.dart';
import 'package:bar_client/service/safe_request/safe_request.dart';

class MenuService {
  final MenuProvider _menuProvider;

  MenuService({
    required MenuProvider menuProvider,
  }) : _menuProvider = menuProvider;

  Future<List<MenuItemModel>> getAllMenuItems() async {
    return safeRequest<List<MenuItemModel>>(_menuProvider.getMenuItems);
  }

  Future<void> createMenuItem({required MenuItemModel menuItem}) async {
    return safeRequest(() => _menuProvider.createMenuItem(menuItem));
  }

  Future<void> updateMenuItem({required MenuItemModel menuItem}) async {
    return safeRequest(() => _menuProvider.updateMenuItem(menuItem));
  }

  Future<void> deleteMenuItem({required int id}) async {
    return safeRequest(() => _menuProvider.deleteMenuItem(id));
  }
}
