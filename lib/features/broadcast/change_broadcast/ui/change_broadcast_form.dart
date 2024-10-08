import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core/src/validators/empty_field_validator.dart';
import 'package:bar_client/core_ui/src/widgets/app_scaffold.dart';
import 'package:bar_client/core_ui/src/widgets/height_spacer.dart';
import 'package:bar_client/core_ui/src/widgets/text_fields/app_text_field.dart';
import 'package:bar_client/features/broadcast/change_broadcast/cubit/change_broadcast_cubit.dart';
import 'package:bar_client/service/models/broadcast/broadcast_model_request.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeBroadcastForm extends StatefulWidget {
  final BroadcastModelRequest? broadcast;

  const ChangeBroadcastForm({
    super.key,
    this.broadcast,
  });

  @override
  State<ChangeBroadcastForm> createState() => _ChangeBroadcastFormState();
}

class _ChangeBroadcastFormState extends State<ChangeBroadcastForm> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.broadcast?.name);
    descriptionController = TextEditingController(text: widget.broadcast?.description);
  }

  @override
  Widget build(BuildContext context) {
    final ChangeBroadcastCubit cubit = context.read<ChangeBroadcastCubit>();

    return AppScaffold(
      title: LocaleKeys.broadcast_createBroadcast.tr(),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            AppTextField(
              validator: const EmptyFieldValidator().check,
              controller: nameController,
            ),
            const HeightSpacer(),
            BlocBuilder<ChangeBroadcastCubit, ChangeBroadcastState>(
              builder: (context, state) => Text(state.dateTimeString),
            ),
            const HeightSpacer(),
            ElevatedButton(
              onPressed: () async {
                final DateTime? dateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                cubit.setDateTime(date: dateTime);
              },
              child: const Text('date'),
            ),
            const HeightSpacer(),
            ElevatedButton(
              onPressed: () async {
                final DateTime initialDateTime = widget.broadcast?.dateTime ?? DateTime.now();
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(initialDateTime),
                );

                cubit.setDateTime(time: time);
              },
              child: const Text('time'),
            ),
            const HeightSpacer(),
            AppTextField(
              validator: const EmptyFieldValidator().check,
              controller: descriptionController,
            ),
            const HeightSpacer(),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    cubit.acceptChanges(
                      name: nameController.text,
                      description: descriptionController.text,
                    );
                  }
                },
                child: Text(LocaleKeys.broadcast_createBroadcast.tr()))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
