// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);
import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str) as Map<String, dynamic>);

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    required this.error,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        error: Error.fromJson(json['error'] as Map<String, dynamic>),
      );

  final Error error;

  Map<String, dynamic> toJson() => {
        'error': error.toJson(),
      };
}

class Error {
  Error({
    required this.code,
    required this.message,
    required this.status,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json['code'] as int,
        message: json['message'] as String,
        status: json['status'] as String,
      );

  final int code;
  final String message;
  final String status;

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'status': status,
      };
}
