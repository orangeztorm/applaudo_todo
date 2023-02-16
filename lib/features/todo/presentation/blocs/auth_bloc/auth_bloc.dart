import 'dart:async';

import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.loginUseCase,
  }) : super(AuthState.initial()) {
    on<Login>(_login);
    on<UpdateLoginToken>(_updateToken);
  }

  final LoginUseCase loginUseCase;
  StreamSubscription? _timerSubscription;

  Future<dynamic> _login(
    Login event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await loginUseCase(
      const LoginParams(
        email: 'test@test.com',
        password: 'password',
      ),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.error,
          failure: failure,
        ),
      ),
      (user) {
        setUpPeriodicTimer(
          int.parse(user.expiresIn),
        );
        emit(
          state.copyWith(
            status: AuthStatus.success,
            user: user,
          ),
        );
      },
    );
  }

  Future<void> _updateToken(
    UpdateLoginToken event,
    Emitter<AuthState> emit,
  ) async {
    console('update token');
    final result = await loginUseCase(
      const LoginParams(
        email: 'test@test.com',
        password: 'password',
      ),
    );
    result.fold(
      (failure) {
        add(const UpdateLoginToken());
      },
      (user) {
        // Handle successful token update here.
      },
    );
  }

  void setUpPeriodicTimer(int durationInSeconds) {
    // A timer that calls the update event every `durationInSeconds` seconds.
    console('started timer');
    _timerSubscription?.cancel();
    _timerSubscription =
        Stream<void>.periodic(Duration(seconds: durationInSeconds)).listen((_) {
      add(const UpdateLoginToken());
    });
  }
}
