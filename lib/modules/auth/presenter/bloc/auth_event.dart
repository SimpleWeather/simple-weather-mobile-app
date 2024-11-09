import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {}

final class AuthSessionEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSessionEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
