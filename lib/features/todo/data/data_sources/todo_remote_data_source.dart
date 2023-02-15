// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:http/http.dart' as http;

/**

This module contains the implementation of TodoRemoteDataSource abstract class.
The class is responsible for providing CRUD operations for todos via Firebase API.
Each function of this class provides different operations, such as:
addCategory
addTodo
getCategory
getTodo
updateTodo
The class uses http package to perform HTTP requests to Firebase API
and returns a Future of a specific model, which has been wrapped inside AddCategoryModel,
AddTodoModel, CategoriesModel, Todos and UpdateTodoModel classes.
*/

// ignore: slash_for_doc_comments
/**

An abstract class that represents the interface for CRUD operations of Todos via Firebase API.
This class defines the following methods:

addTodo
getCategory
getTodos
updateTodo
*/

abstract class TodoRemoteDataSource {
  /// login with hardcoded user credentials
  Future<LoginDataModel> loginUserWithCredentials({
    required String email,
    required String password,
    required String apiKey,
  });

  /// Adds a todos to the Firebase database.
  Future<AddTodoModel> addTodo({
    required int date,
    required String categoryId,
    required String name,
    required bool isCompleted,
    required String apiKey,
  });

  /// Retrieves all categories from the Firebase database.
  Future<CategoriesModel> getCategory({
    required String apiKey,
  });

  /// Retrieves all todos from the Firebase database.
  Future<Todos> getTodos({
    required String apiKey,
  });

  /// Updates a todos in the Firebase database.
  Future<UpdateTodoModel> updateTodo({
    required int date,
    required String categoryId,
    required String name,
    required String todoName,
    required bool isCompleted,
    required String apiKey,
  });
}

// ignore: slash_for_doc_comments
/**

An implementation of TodoRemoteDataSource abstract class that provides CRUD operations for todos via Firebase API.
*/

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  TodoRemoteDataSourceImpl({
    required this.client,
    required this.tokenLocalDataSource,
  });
  final http.Client client;
  final TokenLocalDataSource tokenLocalDataSource;

  @override
  Future<LoginDataModel> loginUserWithCredentials({
    required String email,
    required String password,
    required String apiKey,
  }) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'identitytoolkit.googleapis.com',
        path: '/v1/accounts:signInWithPassword',
        queryParameters: {
          'key': apiKey,
        },
      );

      final body = {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      };

      console('uri $uri');
      console('body $body');

      final response = await client.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          body,
        ),
      );

      if (checkStatusCode(response.statusCode)) {
        return LoginDataModel.fromJson(
          json.decode(
            response.body,
          ) as Map<String, dynamic>,
        );
      } else {
        throw await handleException(response.statusCode, response.body);
      }
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }

  @override
  Future<AddTodoModel> addTodo({
    required int date,
    required String categoryId,
    required String name,
    required bool isCompleted,
    required String apiKey,
  }) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'firestore.googleapis.com',
        path:
            '/v1/projects/applaudo-todo-app/databases/(default)/documents/tasks',
        queryParameters: {
          'key': apiKey,
        },
      );

      final body = {
        'fields': {
          'date': {'integerValue': date},
          'categoryId': {'stringValue': categoryId},
          'name': {'stringValue': name},
          'isCompleted': {'booleanValue': isCompleted}
        }
      };

      final token = await tokenLocalDataSource.getToken();

      console('uri $uri');
      console('body $body');
      console('token $token');

      final response = await client.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(body),
      );

      console('response ${response.body}');

      if (checkStatusCode(response.statusCode)) {
        return AddTodoModel.fromJson(
          json.decode(
            response.body,
          ) as Map<String, dynamic>,
        );
      } else {
        throw await handleException(response.statusCode, response.body);
      }
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }

  @override
  Future<CategoriesModel> getCategory({
    required String apiKey,
  }) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'firestore.googleapis.com',
        path:
            '/v1/projects/applaudo-todo-app/databases/(default)/documents/categories',
        queryParameters: {
          'key': apiKey,
        },
      );

      final token = await tokenLocalDataSource.getToken();

      console('uri $uri');
      console('token $token');

      final response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      console('response ${response.body}');

      if (checkStatusCode(response.statusCode)) {
        return CategoriesModel.fromJson(
          json.decode(
            response.body,
          ) as Map<String, dynamic>,
        );
      } else {
        throw await handleException(response.statusCode, response.body);
      }
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }

  @override
  Future<Todos> getTodos({
    required String apiKey,
  }) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'firestore.googleapis.com',
        path:
            '/v1/projects/applaudo-todo-app/databases/(default)/documents/tasks',
        queryParameters: {
          'key': apiKey,
        },
      );

      final token = await tokenLocalDataSource.getToken();

      // console('uri $uri');
      // console('token $token');

      final response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // console('response ${response.body}');

      if (checkStatusCode(response.statusCode)) {
        return Todos.fromJson(
          json.decode(
            response.body,
          ) as Map<String, dynamic>,
        );
      } else {
        throw await handleException(response.statusCode, response.body);
      }
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }

  @override
  Future<UpdateTodoModel> updateTodo({
    required int date,
    required String categoryId,
    required String name,
    required String todoName,
    required bool isCompleted,
    required String apiKey,
  }) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'firestore.googleapis.com',
        path:
            // '/v1/projects/applaudo-todo-app/databases/(default)/documents/tasks/OdFN2DdAlBXPsny3KUAP',
            '/v1/$name',
        queryParameters: {
          'key': apiKey,
        },
      );

      final body = {
        'fields': {
          'date': {'integerValue': date},
          'categoryId': {'stringValue': categoryId},
          'name': {'stringValue': todoName},
          'isCompleted': {'booleanValue': isCompleted}
        }
      };
      final token = await tokenLocalDataSource.getToken();

      console('uri $uri');
      console('body $body');
      console('token $token');

      final response = await client.patch(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
      );

      console('response update ${response.body}');

      if (checkStatusCode(response.statusCode)) {
        return UpdateTodoModel.fromJson(
          json.decode(
            response.body,
          ) as Map<String, dynamic>,
        );
      } else {
        throw await handleException(response.statusCode, response.body);
      }
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }
}
