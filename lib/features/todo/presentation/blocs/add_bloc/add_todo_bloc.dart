// ignore_for_file: avoid_void_async, no_leading_underscores_for_local_identifiers, unused_element, lines_longer_than_80_chars

import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_todo_event.dart';
part 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  AddTodoBloc({
    required this.addTodoUseCase,
  }) : super(AddTodoState.initial()) {
    on<AddTodo>(_handleAddTodo);
  }

  final AddTodoUseCase addTodoUseCase;

  void _handleAddTodo(
    AddTodo event,
    Emitter<AddTodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AddTodoStatus.submitting,
      ),
    );
    final result = await addTodoUseCase(
      AddTodoParams(
        categoryId: event.category,
        name: event.title,
        date: int.parse(event.date),
        isCompleted: false,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AddTodoStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (success) => {
        emit(
          state.copyWith(
            status: AddTodoStatus.success,
            sucessMessage: success.toString(),
          ),
        ),
      },
    );
  }
}
