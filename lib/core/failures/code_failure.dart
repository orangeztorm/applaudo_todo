import 'package:applaudo_todo/core/core.dart';

class CodeFailure extends Failure {
  /// Constructs a CodeFailure instance.
  /// [message] is the error message.
  /// [code] is an optional code that represents the error.
  // ignore: use_super_parameters
  const CodeFailure({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );
}
