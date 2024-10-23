import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthDatasource {
  Future<AuthResponse> registerUser({
    required String email,
    required String password,
  });
}
