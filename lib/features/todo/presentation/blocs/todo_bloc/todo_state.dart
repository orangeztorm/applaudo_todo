part of 'todo_bloc.dart';

enum TodoStatus {
  initial,
  loading,
  success,
  failure,
}

extension TodoStatusX on TodoStatus {
  bool get isInitial => this == TodoStatus.initial;
  bool get isLoading => this == TodoStatus.loading;
  bool get isSuccess => this == TodoStatus.success;
  bool get isFailure => this == TodoStatus.failure;
}

class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.initial,
    this.todos = const [],
    this.errorMessage,
  });

  final TodoStatus status;
  final List<TodoEntity> todos;
  final String? errorMessage;

  TodoState copyWith({
    TodoStatus? status,
    List<TodoEntity>? todos,
    String? errorMessage,
  }) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        todos,
        errorMessage,
      ];

  @override
  String toString() =>
      '''TodoState { status: $status, todos: $todos, errorMessage: $errorMessage}''';
}
