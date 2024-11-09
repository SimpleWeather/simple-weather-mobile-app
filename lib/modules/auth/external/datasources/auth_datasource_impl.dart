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

    return response;
  }

  @override
  Future<AuthResponse> loginUser({
    required String email,
    required String password,
  }) async {
    final client = Supabase.instance.client.auth;

    final response = await client.signInWithPassword(
      email: email,
      password: password,
    );

    return response;
  }
}
