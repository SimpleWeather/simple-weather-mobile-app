import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<AuthResponse> registerUser({
    required String email,
    required String password,
  }) async =>
      datasource.registerUser(
        email: email,
        password: password,
      );

  @override
  Future<AuthResponse> loginUser({
    required String email,
    required String password,
  }) async =>
      datasource.loginUser(
        email: email,
        password: password,
      );
}
