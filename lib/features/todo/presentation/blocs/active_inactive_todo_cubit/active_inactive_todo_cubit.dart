
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_inactive_todo_state.dart';

class ActiveInactiveTodoCubit extends Cubit<ActiveInactiveTodoState> {
  ActiveInactiveTodoCubit({
    required this.activeTodo,
    required this.inActiveTodo,
  }) : super(ActiveInactiveTodoState.initial());

  void calculateActiveInactiveTodo({
    required List<TodoEntity> activeTodo,
    required List<TodoEntity> inActiveTodo,
  }) {
    emit(
      state.copyWith(
        activeTodo: activeTodo,
        inActiveTodo: inActiveTodo,
      ),
    );
  }

  final List<TodoEntity> activeTodo;
  final List<TodoEntity> inActiveTodo;
}
