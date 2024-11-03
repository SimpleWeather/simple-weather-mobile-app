import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../infra/datasources/auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future<AuthResponse> registerUser({
    required String email,
    required String password,
  }) async {
    final client = Supabase.instance.client.auth;

    final response = await client.signUp(
      email: email,
      password: password,
    );

    final session = response.session;

    if (session != null) {
      (await SharedPreferences.getInstance()).setString(
        'user_session',
        jsonEncode(session.toJson()),
      );

      (await SharedPreferences.getInstance()).setString(
        'userId',
        session.user.id,
      );
    }

    return response;
  }
}
