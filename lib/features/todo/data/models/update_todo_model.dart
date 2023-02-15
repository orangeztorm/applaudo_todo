// To parse this JSON data, do
//
//     final updateModel = updateModelFromJson(jsonString);

import 'dart:convert';

UpdateTodoModel updateModelFromJson(String str) =>
    UpdateTodoModel.fromJson(json.decode(str) as Map<String, dynamic>);

String updateModelToJson(UpdateTodoModel data) => json.encode(data.toJson());

class UpdateTodoModel {
  UpdateTodoModel({
    required this.name,
    required this.fields,
    required this.createTime,
    required this.updateTime,
  });

  factory UpdateTodoModel.fromJson(Map<String, dynamic> json) =>
      UpdateTodoModel(
        name: json['name'] as String,
        fields:
            UpdateTodoFields.fromJson(json['fields'] as Map<String, dynamic>),
        createTime: DateTime.parse(json['createTime'] as String),
        updateTime: DateTime.parse(json['updateTime'] as String),
      );

  final String name;
  final UpdateTodoFields fields;
  final DateTime createTime;
  final DateTime updateTime;

  Map<String, dynamic> toJson() => {
        'name': name,
        'fields': fields.toJson(),
        'createTime': createTime.toIso8601String(),
        'updateTime': updateTime.toIso8601String(),
      };
}

class UpdateTodoFields {
  UpdateTodoFields({
    required this.date,
    required this.isCompleted,
    required this.categoryId,
    required this.name,
  });

  factory UpdateTodoFields.fromJson(Map<String, dynamic> json) =>
      UpdateTodoFields(
        date: UpdateTodoDate.fromJson(json['date'] as Map<String, dynamic>),
        isCompleted: UpdateTodoIsCompleted.fromJson(
            json['isCompleted'] as Map<String, dynamic>,),
        categoryId: UpdateTodoCategoryId.fromJson(
          json['categoryId'] as Map<String, dynamic>,
        ),
        name:
            UpdateTodoCategoryId.fromJson(json['name'] as Map<String, dynamic>),
      );

  final UpdateTodoDate date;
  final UpdateTodoIsCompleted isCompleted;
  final UpdateTodoCategoryId categoryId;
  final UpdateTodoCategoryId name;

  Map<String, dynamic> toJson() => {
        'date': date.toJson(),
        'isCompleted': isCompleted.toJson(),
        'categoryId': categoryId.toJson(),
        'name': name.toJson(),
      };
}

class UpdateTodoCategoryId {
  UpdateTodoCategoryId({
    required this.stringValue,
  });

  factory UpdateTodoCategoryId.fromJson(Map<String, dynamic> json) =>
      UpdateTodoCategoryId(
        stringValue: json['stringValue'] as String,
      );

  final String stringValue;

  Map<String, dynamic> toJson() => {
        'stringValue': stringValue,
      };
}

class UpdateTodoDate {
  UpdateTodoDate({
    required this.integerValue,
  });

  factory UpdateTodoDate.fromJson(Map<String, dynamic> json) => UpdateTodoDate(
        integerValue: json['integerValue'] as String,
      );

  final String integerValue;

  Map<String, dynamic> toJson() => {
        'integerValue': integerValue,
      };
}

class UpdateTodoIsCompleted {
  UpdateTodoIsCompleted({
    required this.booleanValue,
  });

  factory UpdateTodoIsCompleted.fromJson(Map<String, dynamic> json) =>
      UpdateTodoIsCompleted(
        booleanValue: json['booleanValue'] as bool,
      );

  final bool booleanValue;

  Map<String, dynamic> toJson() => {
        'booleanValue': booleanValue,
      };
}
