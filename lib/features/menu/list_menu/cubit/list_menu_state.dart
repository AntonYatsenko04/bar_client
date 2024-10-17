part of 'list_menu_cubit.dart';

sealed class ListMenuState {}

@freezed
class LoadingState implements ListMenuState {
  const factory LoadingState() = _LoadingState;
}

@freezed
class ErrorState implements ListMenuState {
  const factory ErrorState({
    required String errorMessage,
  }) = _ErrorState;
}

@freezed
class DataState implements ListMenuState {
  const factory DataState({
    required List<MenuItemModel> menuItems,
  }) = _DataState;
}
