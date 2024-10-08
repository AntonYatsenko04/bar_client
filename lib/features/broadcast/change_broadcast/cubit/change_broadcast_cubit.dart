import 'dart:convert';

import 'package:bar_client/navigation/app_router/app_router.dart';
import 'package:bar_client/service/exceptions/app_exception.dart';
import 'package:bar_client/service/models/broadcast/broadcast_model_request.dart';
import 'package:bar_client/service/models/broadcast/broadcast_model_response.dart';
import 'package:bar_client/service/services/broadcast_service.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'change_broadcast_state.dart';

class ChangeBroadcastCubit extends Cubit<ChangeBroadcastState> {
  final BroadcastModelResponse? _broadcast;
  final BroadcastService _broadcastService;
  final AppRouter _appRouter;

  ChangeBroadcastCubit({
    required AppRouter appRouter,
    required BroadcastService broadcastService,
    BroadcastModelResponse? broadcast,
  })  : _appRouter = appRouter,
        _broadcast = broadcast,
        _broadcastService = broadcastService,
        super(ChangeBroadcastState(dateTime: broadcast?.dateTime ?? DateTime.now()));

  Future<void> acceptChanges({
    required String name,
    required String description,
  }) async {
    final ChangeBroadcastState currentState = state;

    try {
      if (_broadcast == null) {
        final br = BroadcastModelRequest(
          name: name,
          dateTime: state.dateTime,
          description: description,
        );
        print(jsonEncode(br.toJson()));

        await _broadcastService.createBroadcast(
          broadcast: br,
        );
      } else {
        await _broadcastService.updateBroadcast(
          broadcast: BroadcastModelResponse(
            id: _broadcast.id,
            name: name,
            dateTime: state.dateTime,
            description: description,
          ),
        );
      }
    } on AppException catch (e) {
      emit(currentState.copyWith(commonError: e.errorMessageKey));
    }
  }

  void setDateTime({DateTime? date, TimeOfDay? time}) {
    DateTime dateTime = (date ?? state.dateTime);
    if (time != null) {
      dateTime = dateTime.copyWith(hour: time.hour, minute: time.minute);
    }

    emit(state.copyWith(dateTime: dateTime));
  }
}
