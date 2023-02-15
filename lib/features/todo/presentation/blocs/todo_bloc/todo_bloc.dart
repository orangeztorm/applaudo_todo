// ignore: lines_longer_than_80_chars
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_void_async

import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required this.getTodosUseCase,
    required this.updateTodoUseCase,
  }) : super(const TodoState()) {
    on<GetTodoEvent>(_getTodo);
    on<ToggleTodoEvent>(_toggleTodo);
  }
  final GetTodosUseCase getTodosUseCase;
  final UpdateTodoUseCase updateTodoUseCase;

  void _getTodo(GetTodoEvent event, Emitter<TodoState> emit) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );
    final result = await getTodosUseCase(const NoParams());
    result.fold(
        (failure) => emit(
              state.copyWith(
                status: TodoStatus.failure,
                errorMessage: failure.message,
              ),
            ), (Todo) {
      emit(
        state.copyWith(
          status: TodoStatus.success,
          todos: Todo,
        ),
      );
    });
  }

  void _toggleTodo(
    ToggleTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );
    final result = await updateTodoUseCase(
      UpdateTodoParams(
        categoryId: event.todoEntity.id ?? '',
        name: event.todoEntity.name ?? '',
        todoName: event.todoEntity.todoName ?? '',
        isCompleted: !event.todoEntity.isCompleted!,
        date: 1664072803000,
      ),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: TodoStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (Todos) => add(const GetTodoEvent()),
    );
  }
}
