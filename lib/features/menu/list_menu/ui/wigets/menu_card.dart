import 'package:bar_client/core_ui/src/widgets/height_spacer.dart';
import 'package:bar_client/service/models/menu/menu_item_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final MenuItemModel menuItemModel;

  const MenuCard({
    required this.menuItemModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatCurrency = NumberFormat.simpleCurrency();

    return Card(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(menuItemModel.name),
              const HeightSpacer(),
              Text(menuItemModel.description),
            ],
          ),
          Center(
            child: Text(formatCurrency.format(menuItemModel.price / 100)),
          ),
        ],
      ),
    );
  }
}
