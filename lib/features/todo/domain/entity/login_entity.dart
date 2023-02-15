// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
  });
  final String kind;
  final String localId;
  final String email;
  final String displayName;
  final String idToken;
  final bool registered;
  final String refreshToken;
  final String expiresIn;

  @override
  List<Object> get props {
    return [
      kind,
      localId,
      email,
      displayName,
      idToken,
      registered,
      refreshToken,
      expiresIn,
    ];
  }

  @override
  String toString() {
    return '''LoginEntity(kind: $kind, localId: $localId, email: $email, displayName: $displayName, idToken: $idToken, registered: $registered, refreshToken: $refreshToken, expiresIn: $expiresIn)''';
  }
}
