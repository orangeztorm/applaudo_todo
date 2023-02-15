// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TodoListEntity extends Equatable {
  List<TodoEntity> taskList;
  TodoListEntity({
    required this.taskList,
  });

  @override
  String toString() => 'TaskListEntity(taskList: $taskList)';

  @override
  List<Object> get props => [taskList];
}

class TodoEntity extends Equatable {
  const TodoEntity({
    required this.categoryId,
    required this.id,
    required this.name,
    required this.todoName,
    required this.date,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });
  final String? categoryId;
  final String? id;
  final String? name;
  final String? todoName;
  final String? date;
  final bool? isCompleted;
  final String? createdAt;
  final String? updatedAt;

  @override
  String toString() =>
      '''TodoEntity(id: $id, name: $name, date: $date, isCompleted: $isCompleted , createdAt: $createdAt, updatedAt: $updatedAt, todoName: $todoName, categoryId: $categoryId)''';

  @override
  List<Object?> get props => [
        categoryId,
        id,
        date,
        todoName,
        isCompleted,
        createdAt,
        updatedAt,
        name,
      ];
}
