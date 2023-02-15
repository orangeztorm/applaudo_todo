part of 'add_todo_bloc.dart';

enum AddTodoStatus { initial, submitting, success, failure }

extension TodoStatusX on AddTodoStatus {
  bool get isInitial => this == AddTodoStatus.initial;
  bool get submitting => this == AddTodoStatus.submitting;
  bool get isSuccess => this == AddTodoStatus.success;
  bool get isFailure => this == AddTodoStatus.failure;
}

class AddTodoState extends Equatable {
  const AddTodoState({
    this.status = AddTodoStatus.initial,
    this.sucessMessage = '',
    this.errorMessage = '',
  });

  factory AddTodoState.initial() => const AddTodoState();

  final AddTodoStatus status;
  final String sucessMessage;
  final String errorMessage;

  AddTodoState copyWith({
    AddTodoStatus? status,
    String? sucessMessage,
    String? errorMessage,
  }) {
    return AddTodoState(
      status: status ?? this.status,
      sucessMessage: sucessMessage ?? this.sucessMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, sucessMessage, errorMessage];

  @override
  String toString() {
    return '''AddTodoState { status: $status, sucessMessage: $sucessMessage, errorMessage: $errorMessage }''';
  }
}
