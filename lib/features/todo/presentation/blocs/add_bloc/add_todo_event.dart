part of 'add_todo_bloc.dart';

abstract class AddTodoEvent extends Equatable {
  const AddTodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends AddTodoEvent {
  const AddTodo({
    required this.title,
    required this.date,
    required this.category,
  });
  final String title;
  final String date;
  final String category;

  @override
  List<Object> get props => [
        title,
        date,
        category,
      ];

  @override
  String toString() =>
      '''AddTodo(title: $title, date: $date, category: $category)''';
}
