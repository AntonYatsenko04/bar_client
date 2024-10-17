import 'package:bar_client/core_ui/src/widgets/app_scaffold.dart';
import 'package:bar_client/features/menu/list_menu/cubit/list_menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/src/constants/num_constants.dart';

class ListMenuFrom extends StatelessWidget {
  const ListMenuFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'title',
      child: BlocBuilder<ListMenuCubit, ListMenuState>(
        builder: (BuildContext context, ListMenuState state) {
          final ListMenuState currentState = state;
          switch (currentState) {
            case LoadingState():
            // TODO: Handle this case.
            case ErrorState():
            // TODO: Handle this case.
            case DataState():
              {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: NumConstants.maxCrossAxisExtent,
                  ),
                  itemCount: currentState,
                  itemBuilder: (BuildContext context, int index) {},
                );
              }
          }
        },
      ),
    );
  }
}
