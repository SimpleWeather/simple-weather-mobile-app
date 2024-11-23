import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResponse> registerUser({
    required String email,
    required String password,
  });

  Future<AuthResponse> loginUser({
    required String email,
    required String password,
  });
}
