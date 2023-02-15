import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:applaudo_todo/l10n/l10n.dart';
import 'package:applaudo_todo/locator.dart';
import 'package:applaudo_todo/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => getIt<AuthBloc>()..add(const Login()),
      create: (context) => getIt<AuthBloc>()..add(const Login()),
      child: MaterialApp(
        theme: AppTheme.light.toTheme().data,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: '/home',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
