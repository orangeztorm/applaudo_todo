import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/domain/domain.dart';
import 'package:dartz/dartz.dart';

class GetTodosUseCase
    implements UseCaseFuture<Failure, List<TodoEntity>, NoParams> {
  GetTodosUseCase({
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, List<TodoEntity>>> call(
    NoParams params,
  ) async {
    return todoRepository.getTodos();
  }
}
