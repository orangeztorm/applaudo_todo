// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, prefer_const_constructors_in_immutables, overridden_fields, lines_longer_than_80_chars
import 'dart:convert';
import 'package:applaudo_todo/features/todo/todo.dart';


LoginDataModel loginDataModelFromJson(String str) =>
    LoginDataModel.fromJson(json.decode(str) as Map<String, dynamic>);

String loginDataModelToJson(LoginDataModel data) => json.encode(data.toJson());

class LoginDataModel extends LoginEntity {
  LoginDataModel({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
  }) : super(
    kind: kind,
    localId: localId,
    email: email,
    displayName: displayName,
    idToken: idToken,
    registered: registered,
    refreshToken: refreshToken,
    expiresIn: expiresIn,
  );

  final String kind;
  final String localId;
  final String email;
  final String displayName;
  final String idToken;
  final bool registered;
  final String refreshToken;
  final String expiresIn;

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
    kind: json['kind'] as String,
    localId: json['localId'] as String,
    email: json['email'] as String,
    displayName: json['displayName'] as String,
    idToken: json['idToken'] as String,
    registered: json['registered'] as bool,
    refreshToken: json['refreshToken'] as String,
    expiresIn: json['expiresIn'] as String,
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'localId': localId,
    'email': email,
    'displayName': displayName,
    'idToken': idToken,
    'registered': registered,
    'refreshToken': refreshToken,
    'expiresIn': expiresIn,
  };
}
