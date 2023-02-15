import 'dart:convert';

import 'package:applaudo_todo/core/core.dart';

Future<ServerException> handleException(
  int errorCode,
  String errMessage,
) async {
  console('handleException: $errorCode, $errMessage');
  try {
    final message = ErrorModel.fromJson(
      json.decode(errMessage) as Map<String, dynamic>,
    ).error.message;
    switch (errorCode) {
      case 401:
        return UnAuthenticationServerException(
          message: message,
          code: errorCode,
        );
      case 403:
        return UnAuthorizeServerException(
          message: message,
          code: errorCode,
        );
      case 404:
        return NotFoundServerException(
          message: message,
          code: errorCode,
        );
      case 500:
      case 502:
        return InternalServerException(
          message: message,
          code: errorCode,
        );
      default:
        return GeneralServerException(
          message: message,
          code: errorCode,
        );
    }
  } catch (e) {
    return GeneralServerException(
      message: 'An error occured',
      code: errorCode,
    );
  }
}

bool checkStatusCode(int statusCode) {
  switch (statusCode) {
    case 200:
    case 201:
      return true;
    default:
      return false;
  }
}
