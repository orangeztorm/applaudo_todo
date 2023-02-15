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
  // ignore: strict_raw_type
  late StreamSubscription? _timerSubscription;

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
        setUpPeridicTimer();
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
    final result = await loginUseCase(
      const LoginParams(
        email: 'test@test.com',
        password: 'password',
      ),
    );
    result.fold(
      (failure) {
        // emit(
        //   state.copyWith(
        //     status: AuthStatus.error,
        //     failure: failure,
        //   ),
        // );
        add(const UpdateLoginToken());
      },
      (user) {
        // setUpPeridicTimer();
        // emit(
        //   state.copyWith(
        //     status: AuthStatus.success,
        //     user: user,
        //   ),
        // );
      },
    );
  }

  void setUpPeridicTimer() {
    // a timer that calls the update event every 3600 seconds
    Timer.periodic(const Duration(seconds: 3600), (timer) {
      _timerSubscription?.cancel();
      _timerSubscription =
          // ignore: inference_failure_on_instance_creation
          Stream.periodic(const Duration(seconds: 3600)).listen((_) {
        add(const UpdateLoginToken());
      });
    });
  }
}
