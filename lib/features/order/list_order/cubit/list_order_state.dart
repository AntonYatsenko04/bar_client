part of 'list_order_cubit.dart';

sealed class ListOrderState {}

@freezed
class DataState with _$DataState implements ListOrderState {
  const factory DataState() = _DataState;
}

@freezed
class ErrorState with _$ErrorState implements ListOrderState {
  const factory ErrorState() = _ErrorState;
}

@freezed
class LoadingState with _$LoadingState implements ListOrderState {
  const factory LoadingState() = _LoadingState;
}
