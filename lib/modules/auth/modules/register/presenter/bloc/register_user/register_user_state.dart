part of 'register_user_bloc.dart';

abstract class RegisterUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterUserInitialState extends RegisterUserState {}

class RegisterUserLoadingState extends RegisterUserState {}

class RegisterUserSuccessState extends RegisterUserState {
  final AuthResponse authResponse;

  RegisterUserSuccessState(this.authResponse);
}

class RegisterUserErrorState extends RegisterUserState {
  final String message;

  RegisterUserErrorState(this.message);
}
