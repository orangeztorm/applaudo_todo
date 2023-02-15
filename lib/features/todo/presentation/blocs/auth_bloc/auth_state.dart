part of 'auth_bloc.dart';


enum AuthStatus { initial, loading, success, error }

class AuthState extends Equatable {
  const AuthState({
    required this.status,
    this.user,
    this.failure,
  });

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.initial,
    );
  }
  final AuthStatus status;
  final LoginEntity? user;
  final Failure? failure;

  @override
  String toString() {
    return '''
AuthState {
      status: $status,
      user: $user,
      failure: $failure,
    }
    ''';
  }

  @override
  List<Object?> get props => [
        status,
        user,
        failure,
      ];

  AuthState copyWith({
    AuthStatus? status,
    LoginEntity? user,
    Failure? failure,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }
}
