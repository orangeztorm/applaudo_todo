import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddTodoUseCase implements UseCaseFuture<Failure, dynamic, AddTodoParams> {
  AddTodoUseCase({
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    AddTodoParams params,
  ) async {
    return todoRepository.addTodo(
      categoryId: params.categoryId,
      date: params.date,
      isCompleted: params.isCompleted,
      name: params.name,
    );
  }
}

class AddTodoParams extends Equatable {
  const AddTodoParams({
    required this.date,
    required this.categoryId,
    required this.name,
    required this.isCompleted,
  });

  final int date;
  final String categoryId;
  final String name;
  final bool isCompleted;

  @override
  List<Object> get props => [
        date,
        categoryId,
        name,
        isCompleted,
      ];
}
