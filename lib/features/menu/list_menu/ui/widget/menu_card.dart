import 'package:bar_client/core_ui/src/theme/app_text_styles.dart';
import 'package:bar_client/core_ui/src/utils/number_formatters.dart';
import 'package:bar_client/core_ui/src/widgets/height_spacer.dart';
import 'package:bar_client/core_ui/src/widgets/width_spacer.dart';
import 'package:bar_client/service/models/menu/menu_item_response.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final MenuItemResponse menuItemModel;
  final VoidCallback deleteCallback;
  final VoidCallback editCallback;

  const MenuCard({
    required this.menuItemModel,
    required this.deleteCallback,
    required this.editCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    menuItemModel.name,
                    style: AppTextStyles.s18W500H24Regular,
                  ),
                  const HeightSpacer(),
                  Text(
                    menuItemModel.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  const HeightSpacer(),
                  Center(
                    child: Text(NumberFormatters.formatCurrency(menuItemModel.price)),
                  ),
                  const HeightSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: deleteCallback,
                        icon: const Icon(Icons.delete_forever),
                      ),
                      const WidthSpacer(),
                      IconButton(
                        onPressed: editCallback,
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
