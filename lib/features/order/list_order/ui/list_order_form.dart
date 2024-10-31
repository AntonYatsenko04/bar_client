import 'package:auto_route/auto_route.dart';
import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core_ui/src/widgets/app_scaffold.dart';
import 'package:bar_client/navigation/app_router/app_router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListOrderForm extends StatelessWidget {
  const ListOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: LocaleKeys.order_orders.tr(),
      leading: IconButton(
          onPressed: () {
            context.router.push(const AddOrderItemRoute());
          },
          icon: const Icon(Icons.add)),
      child: Center(),
    );
  }
}
