
// ignore_for_file: avoid_dynamic_calls, sort_constructors_first, prefer_collection_literals, omit_local_variable_types, annotate_overrides, overridden_fields, must_be_immutable, lines_longer_than_80_chars

import 'package:applaudo_todo/features/todo/todo.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    this.name,
    this.categoryName,
    this.color,
    this.createTime,
    this.updateTime,
  }) : super(
          name: name,
          createdAt: createTime,
          updatedAt: updateTime,
          categoryName: categoryName,
          color: color,
        );
  CategoryModel.fromJson(Map<String, dynamic> json)
      : super(
          name: json['name'] as String?,
          color: json['fields']['color'] != null
              ? json['fields']['color']['stringValue'] as String?
              : null,
          categoryName: json['fields']['name'] != null
              ? json['fields']['name']['stringValue'] as String?
              : null,
          createdAt: json['createTime'] as String?,
          updatedAt: json['updateTime'] as String?,
        ) {
    name = json['name'] as String?;
    color = json['fields']['color'] != null
        ? json['fields']['color']['stringValue'] as String?
        : null;
    categoryName = json['fields']['name'] != null
        ? json['fields']['name']['stringValue'] as String?
        : null;
    createTime = json['createTime'] as String?;
    updateTime = json['updateTime'] as String?;
    categoryName = json['fields']['name'] != null
        ? json['fields']['name']['stringValue'] as String?
        : null;
  }
  String? name;
  String? color;
  String? createTime;
  String? updateTime;
  String? categoryName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['fields'] = {
      'color': {'stringValue': color},
      'name': {'stringValue': categoryName},
    };
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    return data;
  }
}

class CategoriesModel {
  List<CategoryModel?>? documents;

  CategoriesModel({
    this.documents,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <CategoryModel>[];
      json['documents'].forEach((v) {
        documents?.add(CategoryModel.fromJson(v as Map<String, dynamic>));
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
