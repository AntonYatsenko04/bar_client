import 'package:bar_client/core_ui/src/utils/number_formatters.dart';
import 'package:bar_client/core_ui/src/widgets/height_spacer.dart';
import 'package:bar_client/service/models/order/order_response.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  final OrderResponse order;

  const OrderView({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
