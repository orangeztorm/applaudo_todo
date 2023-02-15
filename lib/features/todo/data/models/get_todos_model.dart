// ignore_for_file: avoid_dynamic_calls, sort_constructors_first, prefer_collection_literals, omit_local_variable_types

import 'package:applaudo_todo/features/todo/todo.dart';

class Todo extends TodoEntity {
  Todo({
    this.name,
    this.todoName,
    this.date,
    this.id,
    this.categoryId,
    this.createTime,
    this.updateTime,
    this.isCompleted,
  }) : super(
          id: id,
          name: name,
          date: date,
          isCompleted: isCompleted,
          createdAt: createTime,
          updatedAt: updateTime,
          todoName: todoName,
          categoryId: categoryId,
        );
  Todo.fromJson(Map<String, dynamic> json)
      : super(
          name: json['name'] as String?,
          id: json['fields']['id'] != null
              ? json['fields']['id']['stringValue'] as String?
              : null,
          todoName: json['fields']['name'] != null
              ? json['fields']['name']['stringValue'] as String?
              : null,
          date: json['fields']['date'] != null
              ? json['fields']['date']['stringValue'] as String?
              : null,
          isCompleted: json['fields']['isCompleted'] != null
              ? json['fields']['isCompleted']['booleanValue'] as bool?
              : null,
          createdAt: json['createTime'] as String?,
          updatedAt: json['updateTime'] as String?,
          categoryId: json['fields']['categoryId'] != null
              ? json['fields']['categoryId']['stringValue'] as String?
              : null,
        ) {
    name = json['name'] as String?;
    date = json['fields']['date'] != null
        ? json['fields']['date']['stringValue'] as String?
        : null;
    id = json['fields']['id'] != null
        ? json['fields']['id']['stringValue'] as String?
        : null;
    categoryId = json['fields']['categoryId'] != null
        ? json['fields']['categoryId']['stringValue'] as String?
        : null;
    createTime = json['createTime'] as String?;
    updateTime = json['updateTime'] as String?;
    todoName = json['fields']['name'] != null
        ? json['fields']['name']['stringValue'] as String?
        : null;
    isCompleted = json['fields']['isCompleted'] != null
        ? json['fields']['isCompleted']['booleanValue'] as bool?
        : null;
  }
  String? name;
  String? date;
  String? id;
  String? categoryId;
  String? createTime;
  String? updateTime;
  String? todoName;
  bool? isCompleted;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['fields'] = {
      'date': {'stringValue': date},
      'id': {'stringValue': id},
      'name': {'stringValue': todoName},
      'isCompleted': {'booleanValue': isCompleted},
      'categoryId': {'stringValue': categoryId}
    };
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    return data;
  }
}

class Todos {
  List<Todo?>? documents;

  Todos({
    this.documents,
  });

  Todos.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Todo>[];
      json['documents'].forEach((v) {
        documents?.add(Todo.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // ignore: unnecessary_this
    if (this.documents != null) {
      // ignore: unnecessary_this
      data['documents'] = this.documents?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

//

// To parse this JSON data, do
//
//     final tasks = tasksFromJson(jsonString);
