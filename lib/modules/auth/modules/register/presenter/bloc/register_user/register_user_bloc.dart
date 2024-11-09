import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../presenter/bloc/auth_bloc.dart';
import '../../../../../presenter/bloc/auth_event.dart';
import '../../../../../presenter/bloc/auth_state.dart';
import '../../../domain/usecases/register_user.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends AuthBloc {
  RegisterUserBloc() : super(AuthInitialState()) {
    on<AuthSessionEvent>(
      _registerUser,
    );
  }

  Future<void> _registerUser(AuthSessionEvent event, emit) async {
    emit(AuthLoadingState());

    emit(
      (await Modular.get<RegisterUser>().call(
        email: event.email,
        password: event.password,
      ))
          .fold(
        (exception) => AuthErrorState(
          exception.toString(),
        ),
        AuthSuccessState.new,
      ),
    );
  }
}
