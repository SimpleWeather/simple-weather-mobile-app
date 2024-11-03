part of 'register_user_bloc.dart';

abstract class RegisterUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterNewUserEvent extends RegisterUserEvent {
  final String email;
  final String password;

  RegisterNewUserEvent({
    required this.email,
    required this.password,
  });
}
