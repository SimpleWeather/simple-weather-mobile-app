import 'package:flutter/material.dart';

import '../../../../presenter/view_models/auth_view_model.dart';

class LoginViewModel extends AuthViewModel {
  @override
  bool get buttonIsEnabled => email.text.isNotEmpty && password.text.isNotEmpty;

  @override
  final email = TextEditingController();

  @override
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }
}
