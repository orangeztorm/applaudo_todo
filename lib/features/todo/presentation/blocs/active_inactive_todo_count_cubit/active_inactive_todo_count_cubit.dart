import 'package:applaudo_todo/core/core.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_inactive_todo_count_state.dart';

class ActiveInactiveTodoCountCubit extends Cubit<ActiveInactiveTodoCountState> {
  ActiveInactiveTodoCountCubit({
    required this.activeTodoCount,
    required this.inactiveTodoCount,
  }) : super(ActiveInactiveTodoCountState.initial());
  final int activeTodoCount;
  final int inactiveTodoCount;

  void calculateActiveInactiveTodoCount({
    required int activeTodoCount,
    required int inactiveTodoCount,
  }) {
    console('ran calculateActiveInactiveTodoCount');
    emit(
      state.copyWith(
        activeTodoCount: activeTodoCount,
        inactiveTodoCount: inactiveTodoCount,
      ),
    );
  }
}
