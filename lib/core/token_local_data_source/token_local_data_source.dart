import 'package:applaudo_todo/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenLocalDataSource {
  // ignore: comment_references
  /// Gets the cached [Token] which was saved
  /// the user had an internet connection.
  ///

  Future<String> getToken();

  Future<void> cacheToken(String token);
}

class TokenDataSourceImpl implements TokenLocalDataSource {
  TokenDataSourceImpl({
    required this.sharedPreferences,
  });
  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheToken(String token) async {
    await sharedPreferences.setString(TOKEN, token);
    return;
  }

  @override
  Future<String> getToken() {
    final token = sharedPreferences.getString(TOKEN) ?? '';
    return Future.value(token);
  }
}
