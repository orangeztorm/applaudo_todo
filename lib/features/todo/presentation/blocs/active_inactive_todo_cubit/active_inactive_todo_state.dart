// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'active_inactive_todo_cubit.dart';

class ActiveInactiveTodoState extends Equatable {
  final List<TodoEntity> activeTodo;
  final List<TodoEntity> inActiveTodo;

  const ActiveInactiveTodoState({
    this.activeTodo = const <TodoEntity>[],
    this.inActiveTodo = const <TodoEntity>[],
  });

  factory ActiveInactiveTodoState.initial() {
    return const ActiveInactiveTodoState();
  }

  ActiveInactiveTodoState copyWith({
    List<TodoEntity>? activeTodo,
    List<TodoEntity>? inActiveTodo,
  }) {
    return ActiveInactiveTodoState(
      activeTodo: activeTodo ?? this.activeTodo,
      inActiveTodo: inActiveTodo ?? this.inActiveTodo,
    );
  }

  @override
  List<Object?> get props => [
        activeTodo,
        inActiveTodo,
      ];

  @override
  String toString() =>
      '''ActiveInactiveTodoState { activeTodo: $activeTodo, inActiveTodo: $inActiveTodo}''';
}
