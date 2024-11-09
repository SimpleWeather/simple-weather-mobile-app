import 'package:flutter/material.dart';

abstract class AuthViewModel {
  abstract final TextEditingController email;

  abstract final TextEditingController password;

  bool get buttonIsEnabled;

  void dispose();
}
