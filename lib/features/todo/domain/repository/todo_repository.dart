import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, LoginEntity>> loginWithCredentials({
    required String email,
    required String password,
  });

  Future<Either<Failure, TodobaseEntity>> addTodo({
    required int date,
    required String name,
    required bool isCompleted,
    required String categoryId,
  });

  Future<Either<Failure, TodobaseEntity>> updateTodo({
    required int date,
    required String name,
    required String todoName,
    required bool isCompleted,
    required String categoryId,
  });

  Future<Either<Failure, List<TodoEntity>>> getTodos();

  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
