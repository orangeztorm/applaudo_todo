import 'dart:io' show Platform;

import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/counter/counter.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // static const String  = '/';
  static const String counterPage = '/counterPage';
  static const String home = '/home';
  static const String addTodoPage = '/addTodoPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counterPage:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const CounterPage())
            : MaterialPageRoute(builder: (_) => const CounterPage());

      case home:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const TodoPage())
            : MaterialPageRoute(builder: (_) => const TodoPage());

      case addTodoPage:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const AddTodoPage())
            : MaterialPageRoute(builder: (_) => const AddTodoPage());

      default:
        return errorRoute();

      // return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return CupertinoPageRoute(
      builder: (_) {
        return const NotFoundPage();
      },
    );
  }
}
