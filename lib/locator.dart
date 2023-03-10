import 'dart:io';

import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: cascade_invocations
final getIt = GetIt.instance;

Future<void> setupLocator() async {
  await _setupCore();
  // // |+-----------------------------------------------------------------------+|
  // // |+                               FEATURES                                +|
  // // |+-----------------------------------------------------------------------+|

  // // ---------------------------------- AUTH -----------------------------------

  // // Data

  // // Domain

  // // Presentation

  // --------------------------------- auth ------------------------------
  //bloc
  getIt.registerFactory(
    () => AuthBloc(
      loginUseCase: getIt(),
    ),
  );

  // usecases
  getIt.registerLazySingleton(
    () => LoginUseCase(
      todoRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetCategoriesUseCase(todoRepository: getIt()),
  );

  getIt.registerFactory(
    () => TodoBloc(
      getTodosUseCase: getIt(),
      updateTodoUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => AddTodoBloc(
      addTodoUseCase: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetTodosUseCase(
      todoRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => UpdateTodoUseCase(
      todoRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AddTodoUseCase(
      todoRepository: getIt(),
    ),
  );

  getIt.registerFactory(
    () => CategoryBloc(
      getCategoriesUseCase: getIt(),
    ),
  );

  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      networkInfo: getIt(),
      todoRemoteDataSource: getIt(),
      tokenLocalDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(
      client: getIt(),
      tokenLocalDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<TokenLocalDataSource>(
    () => TokenDataSourceImpl(
      sharedPreferences: getIt(),
    ),
  );

  // getIt.registerLazySingleton(http.Client.new);
}

Future<void> _setupCore() async {
  // External
  getIt.registerLazySingleton(InternetConnectionChecker.new);

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );

  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(
    http.Client.new,
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
