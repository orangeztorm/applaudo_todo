import 'dart:io';

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

  // // --------------------------------- signup ------------------------------
  // //bloc
  // getIt.registerFactory(
  //   () => SignInBloc(
  //     loginUseCase: getIt(),
  //   ),
  // );

  // getIt.registerFactory(
  //   () => NewTaskCubit(),
  // );

  // // usecases
  // getIt.registerLazySingleton(() => LoginUseCase(loginRepository: getIt()));

  // getIt.registerLazySingleton(
  //   () => GetCategoriesUseCase(todoRepository: getIt()),
  // );

  // // repository
  // getIt.registerLazySingleton<LoginRepository>(
  //   () => LoginRepositoryImpl(
  //     networkInfo: getIt(),
  //     loginRemoteDataSource: getIt(),
  //     tokenLocalDataSource: getIt(),
  //   ),
  // );

  // // datasources
  // getIt.registerLazySingleton<LoginRemoteDataSource>(
  //   () => LoginRemoteDataSourceImpl(
  //     client: getIt(),
  //   ),
  // );

  // // --------------------------------- Task Feature ------------------------------
  // getIt.registerFactory(
  //   () => TaskBloc(
  //     addTaskUseCase: getIt(),
  //     getTasksUseCase: getIt(),
  //     updateTaskUseCase: getIt(),
  //   ),
  // );

  // getIt.registerLazySingleton(() => AddTaskUseCase(todoRepository: getIt()));
  // getIt.registerLazySingleton(() => GetTasksUseCase(todoRepository: getIt()));
  // getIt.registerLazySingleton(() => UpdateTaskUseCase(todoRepository: getIt()));

  // getIt.registerLazySingleton<TodoRepository>(
  //   () => TodoRepositoryImpl(
  //     networkInfo: getIt(),
  //     todoRemoteDataSource: getIt(),
  //   ),
  // );

  // getIt.registerLazySingleton<TodoRemoteDataSource>(
  //   () => TodoRemoteDataSourceImpl(
  //     client: getIt(),
  //     tokenLocalDataSource: getIt(),
  //   ),
  // );

  // getIt.registerLazySingleton<TokenLocalDataSource>(
  //   () => TokenDataSourceImpl(
  //     sharedPreferences: getIt(),
  //   ),
  // );

  // --------------------------------- Task Feature ---------------------------

  // getIt.registerLazySingleton(http.Client.new);
}

Future<void> _setupCore() async {
  // External
  getIt.registerLazySingleton(InternetConnectionChecker.new);

  final sharedPreferences = await SharedPreferences.getInstance();

  // getIt.registerLazySingleton<NetworkInfo>(
  //   () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  // );

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
