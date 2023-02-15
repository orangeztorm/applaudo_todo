// To parse this JSON data, do
//
//     final addTodoModel = addTodoModelFromJson(jsonString);

import 'dart:convert';

AddTodoModel addTodoModelFromJson(String str) =>
    AddTodoModel.fromJson(json.decode(str) as Map<String, dynamic>);

String addTodoModelToJson(AddTodoModel data) => json.encode(data.toJson());

class AddTodoModel {
  AddTodoModel({
    required this.name,
    required this.fields,
    required this.createTime,
    required this.updateTime,
  });

  factory AddTodoModel.fromJson(Map<String, dynamic> json) => AddTodoModel(
        name: json['name'] as String,
        fields: AddTodoFields.fromJson(json['fields'] as Map<String, dynamic>),
        createTime: DateTime.parse(json['createTime'] as String),
        updateTime: DateTime.parse(json['updateTime'] as String),
      );

  final String name;
  final AddTodoFields fields;
  final DateTime createTime;
  final DateTime updateTime;

  Map<String, dynamic> toJson() => {
        'name': name,
        'fields': fields.toJson(),
        'createTime': createTime.toIso8601String(),
        'updateTime': updateTime.toIso8601String(),
      };
}

class AddTodoFields {
  AddTodoFields({
    required this.date,
    required this.categoryId,
    required this.isCompleted,
    required this.name,
  });

  factory AddTodoFields.fromJson(Map<String, dynamic> json) => AddTodoFields(
        date: AddTodoDate.fromJson(json['date'] as Map<String, dynamic>),
        categoryId: AddTodoCategoryId.fromJson(
          json['categoryId'] as Map<String, dynamic>,
        ),
        isCompleted: AddTodoIsCompleted.fromJson(
          json['isCompleted'] as Map<String, dynamic>,
        ),
        name: AddTodoCategoryId.fromJson(json['name'] as Map<String, dynamic>),
      );

  final AddTodoDate date;
  final AddTodoCategoryId categoryId;
  final AddTodoIsCompleted isCompleted;
  final AddTodoCategoryId name;

  Map<String, dynamic> toJson() => {
        'date': date.toJson(),
        'categoryId': categoryId.toJson(),
        'isCompleted': isCompleted.toJson(),
        'name': name.toJson(),
      };
}

class AddTodoCategoryId {
  AddTodoCategoryId({
    required this.stringValue,
  });

  factory AddTodoCategoryId.fromJson(Map<String, dynamic> json) =>
      AddTodoCategoryId(
        stringValue: json['stringValue'] as String,
      );

  final String stringValue;

  Map<String, dynamic> toJson() => {
        'stringValue': stringValue,
      };
}

class AddTodoDate {
  AddTodoDate({
    required this.integerValue,
  });

  factory AddTodoDate.fromJson(Map<String, dynamic> json) => AddTodoDate(
        integerValue: json['integerValue'] as String,
      );

  final String integerValue;

  Map<String, dynamic> toJson() => {
        'integerValue': integerValue,
      };
}

class AddTodoIsCompleted {
  AddTodoIsCompleted({
    required this.booleanValue,
  });

  factory AddTodoIsCompleted.fromJson(Map<String, dynamic> json) =>
      AddTodoIsCompleted(
        booleanValue: json['booleanValue'] as bool,
      );

  final bool booleanValue;

  Map<String, dynamic> toJson() => {
        'booleanValue': booleanValue,
      };
}
