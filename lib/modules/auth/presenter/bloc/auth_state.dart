import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class AuthState extends Equatable {}

final class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthSuccessState extends AuthState {
  final AuthResponse? response;

  AuthSuccessState(this.response);

  @override
  List<Object?> get props => [
        response,
      ];
}

final class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}
