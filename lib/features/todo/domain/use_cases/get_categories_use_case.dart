import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/domain/domain.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUseCase
    implements UseCaseFuture<Failure, List<CategoryEntity>, NoParams> {
  GetCategoriesUseCase({
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
    NoParams params,
  ) async {
    return todoRepository.getCategories();
  }
}
