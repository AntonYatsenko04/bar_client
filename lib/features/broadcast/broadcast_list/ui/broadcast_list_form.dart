import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core_ui/src/widgets/app_scaffold.dart';
import 'package:bar_client/features/broadcast/broadcast_list/ui/broadcast_card.dart';
import 'package:bar_client/features/broadcast/change_broadcast/ui/change_broadcast_screen.dart';
import 'package:bar_client/service/models/broadcast/broadcast_model_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/broadcast_list_cubit.dart';

class BroadcastListForm extends StatelessWidget {
  const BroadcastListForm({super.key});

  @override
  Widget build(BuildContext context) {
    final BroadcastListCubit cubit = context.read<BroadcastListCubit>();

    return AppScaffold(
      title: LocaleKeys.broadcast_broadcastList.tr(),
      child: BlocBuilder<BroadcastListCubit, BroadcastListState>(
        builder: (BuildContext context, BroadcastListState state) {
          switch (state) {
            case DataState():
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemCount: state.broadcasts.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == state.broadcasts.length) {
                    return FilledButton(
                      onPressed: () {
                        showAdaptiveDialog(
                            context: context,
                            builder: (_) {
                              return ChangeBroadcastScreen();
                            });
                      },
                      child: Text(LocaleKeys.broadcast_createBroadcast.tr()),
                    );
                  }
                  final BroadcastModelResponse broadcast = state.broadcasts[index];

                  return BroadcastCard(
                    name: broadcast.name,
                    dateTime: broadcast.dateTime,
                    description: broadcast.description,
                  );
                },
              );
            case ErrorState():
              return Text('error');
            case LoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
