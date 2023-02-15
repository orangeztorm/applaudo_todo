part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class ToggleTodoEvent extends TodoEvent {
  const ToggleTodoEvent({
    required this.todoEntity,
  });
  final TodoEntity todoEntity;

  @override
  List<Object> get props => [
        todoEntity,
      ];

  @override
  String toString() => '''ToggleTodoEvent(todoEntity: $todoEntity)''';
}

class GetTodoEvent extends TodoEvent {
  const GetTodoEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => '''GetTodosEvent''';
}
