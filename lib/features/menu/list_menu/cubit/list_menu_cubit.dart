import 'package:bar_client/service/models/menu/menu_item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_menu_cubit.freezed.dart';
part 'list_menu_state.dart';

class ListMenuCubit extends Cubit<ListMenuState> {
  ListMenuCubit() : super(const LoadingState());
}
