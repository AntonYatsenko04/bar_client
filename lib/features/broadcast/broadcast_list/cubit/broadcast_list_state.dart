part of 'broadcast_list_cubit.dart';

@immutable
sealed class BroadcastListState {}

final class DataState implements BroadcastListState {
  final List<BroadcastModelResponse> broadcasts;

  DataState({required this.broadcasts});
}

final class ErrorState implements BroadcastListState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

final class LoadingState implements BroadcastListState {}
