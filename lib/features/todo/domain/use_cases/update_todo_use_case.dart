import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateTodoUseCase
    implements UseCaseFuture<Failure, dynamic, UpdateTodoParams> {
  UpdateTodoUseCase({
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    UpdateTodoParams params,
  ) async {
    return todoRepository.updateTodo(
      categoryId: params.categoryId,
      date: params.date,
      isCompleted: params.isCompleted,
      name: params.name,
      taskName: params.taskName,
    );
  }
}

class UpdateTodoParams extends Equatable {
  const UpdateTodoParams({
    required this.date,
    required this.categoryId,
    required this.name,
    required this.taskName,
    required this.isCompleted,
  });

  final int date;
  final String categoryId;
  final String name;
  final String taskName;
  final bool isCompleted;

  @override
  List<Object> get props => [
        date,
        categoryId,
        name,
        taskName,
        isCompleted,
      ];
}
