import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase implements UseCaseFuture<Failure, LoginEntity, LoginParams> {
  LoginUseCase({
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, LoginEntity>> call(
      LoginParams params,
      ) async {
    return todoRepository.loginWithCredentials(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [
    email,
    password,
  ];
}
