import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../presenter/view_models/auth_view_model.dart';
import '../bloc/register_user/register_user_bloc.dart';

class RegisterViewModelImpl implements AuthViewModel {
  final bloc = Modular.get<RegisterUserBloc>();

  @override
  final email = TextEditingController();

  @override
  final password = TextEditingController();

  @override
  bool get buttonIsEnabled => email.text.isNotEmpty && password.text.isNotEmpty;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }
}
