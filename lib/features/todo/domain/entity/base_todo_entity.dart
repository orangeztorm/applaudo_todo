// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodobaseEntity extends Equatable {
  String message;
  int statusCode;
  TodobaseEntity({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object> get props => [
        message,
        statusCode,
      ];

  @override
  String toString() =>
      'TodobaseEntity(message: $message, statusCode: $statusCode)';
}
