
import 'package:applaudo_todo/app/app.dart';
import 'package:applaudo_todo/bootstrap.dart';
import 'package:applaudo_todo/locator.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await bootstrap(() => const App());
}
