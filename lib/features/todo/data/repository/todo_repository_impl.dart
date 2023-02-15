import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:dartz/dartz.dart';

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl({
    required this.networkInfo,
    required this.todoRemoteDataSource,
    required this.tokenLocalDataSource,
  });

  final TodoRemoteDataSource todoRemoteDataSource;
  final TokenLocalDataSource tokenLocalDataSource;
  final NetworkInfo networkInfo;

  static const String _noInternetConnection = 'No internet connection';
  static const int _noInternetConnectionCode = 400;

  @override
  Future<Either<Failure, LoginEntity>> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        // final String token = sharedPreferences.getString(TOKEN) ?? '';
        final result = await todoRemoteDataSource.loginUserWithCredentials(
          email: email,
          apiKey: apiKey,
          password: password,
        );
        await tokenLocalDataSource.cacheToken(result.idToken);
        return Right(
          result,
        );
      } else {
        return const Left(
          ServerFailure(
            message: _noInternetConnection,
            code: _noInternetConnectionCode,
          ),
        );
      }
    } on ServerException catch (e) {
      console('passed server exception');
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TodobaseEntity>> addTodo({
    required int date,
    required String name,
    required bool isCompleted,
    required String categoryId,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        // final String token = sharedPreferences.getString(TOKEN) ?? '';
        final result = await todoRemoteDataSource.addTodo(
          date: date,
          categoryId: categoryId,
          name: name,
          isCompleted: isCompleted,
          apiKey: apiKey,
        );
        return Right(
          TodobaseEntity(
            message: 'Added todo ${result.name}',
            statusCode: 200,
          ),
        );
      } else {
        return const Left(
          ServerFailure(
            message: _noInternetConnection,
            code: _noInternetConnectionCode,
          ),
        );
      }
    } on ServerException catch (e) {
      console('passed server exception : $e');
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      if (await networkInfo.isConnected) {
        // final String token = sharedPreferences.getString(TOKEN) ?? '';
        final result = await todoRemoteDataSource.getCategory(
          apiKey: apiKey,
        );
        return Right(
          result.documents as List<CategoryEntity>? ?? [],
        );
      } else {
        return const Left(
          ServerFailure(
            message: _noInternetConnection,
            code: _noInternetConnectionCode,
          ),
        );
      }
    } on ServerException catch (e) {
      console('passed server exception $e');
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() async {
    try {
      if (await networkInfo.isConnected) {
        final result = await todoRemoteDataSource.getTodos(
          apiKey: apiKey,
        );
        return Right(
          result.documents as List<TodoEntity>? ?? [],
        );
      } else {
        return const Left(
          ServerFailure(
            message: _noInternetConnection,
            code: _noInternetConnectionCode,
          ),
        );
      }
    } on ServerException catch (e) {
      console('passed server exception $e');
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      console('passed server exception $e');
      return Left(
        ServerFailure(
          message: e.toString(),
          code: 400,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TodobaseEntity>> updateTodo({
    required int date,
    required String name,
    required String todoName,
    required bool isCompleted,
    required String categoryId,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        // final String token = sharedPreferences.getString(TOKEN) ?? '';
        final result = await todoRemoteDataSource.updateTodo(
          date: date,
          categoryId: categoryId,
          name: name,
          isCompleted: isCompleted,
          todoName: todoName,
          apiKey: apiKey,
        );
        return Right(
          TodobaseEntity(
            message: 'Updated Todo ${result.name}',
            statusCode: 200,
          ),
        );
      } else {
        return const Left(
          ServerFailure(
            message: _noInternetConnection,
            code: _noInternetConnectionCode,
          ),
        );
      }
    } on ServerException catch (e) {
      console('passed server exception $e');
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    }
  }
}
