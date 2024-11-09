import 'package:flutter_modular/flutter_modular.dart';

import '../../../../presenter/bloc/auth_bloc.dart';
import '../../../../presenter/bloc/auth_event.dart';
import '../../../../presenter/bloc/auth_state.dart';
import '../../domain/usecases/login_user.dart';

class LoginBloc extends AuthBloc {
  LoginBloc() : super(AuthInitialState()) {
    on<AuthSessionEvent>(
      _loginUser,
    );
  }

  Future<void> _loginUser(AuthSessionEvent event, emit) async {
    emit(AuthLoadingState());

    emit(
      (await Modular.get<LoginUser>().call(
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
