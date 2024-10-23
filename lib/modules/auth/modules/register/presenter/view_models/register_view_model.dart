import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/register_user/register_user_bloc.dart';

abstract class RegisterViewModel {
  abstract final TextEditingController email;
  abstract final TextEditingController password;

  abstract final RegisterUserBloc bloc;

  void register();

  void dispose();
}

class RegisterViewModelImpl implements RegisterViewModel {
  @override
  final bloc = Modular.get<RegisterUserBloc>();

  @override
  final email = TextEditingController();

  @override
  final password = TextEditingController();

  @override
  void register() => bloc.add(
        RegisterNewUserEvent(
          email: email.text,
          password: password.text,
        ),
      );

  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }
}
