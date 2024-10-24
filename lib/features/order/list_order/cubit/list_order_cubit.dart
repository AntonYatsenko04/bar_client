import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_order_cubit.freezed.dart';
part 'list_order_state.dart';

class ListOrderCubit extends Cubit<ListOrderState> {
  ListOrderCubit() : super(const LoadingState());
}
