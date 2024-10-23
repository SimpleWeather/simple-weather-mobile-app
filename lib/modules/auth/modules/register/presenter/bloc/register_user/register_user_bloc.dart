import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/usecases/register_user.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc() : super(RegisterUserInitialState()) {
    on<RegisterNewUserEvent>(_registerUser);
  }

  Future<void> _registerUser(
    RegisterNewUserEvent event,
    emit,
  ) async {
    emit(RegisterUserLoadingState());

    emit(
      (await Modular.get<RegisterUser>().call(
        email: event.email,
        password: event.password,
      ))
          .fold(
        (exception) => RegisterUserErrorState(
          exception.toString(),
        ),
        RegisterUserSuccessState.new,
      ),
    );
  }
}
