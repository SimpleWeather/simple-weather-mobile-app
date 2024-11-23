import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/repositories/auth_repository.dart';

abstract class RegisterUser {
  Future<Either<Exception, AuthResponse>> call({
    required String email,
    required String password,
  });
}

class RegisterUserImpl implements RegisterUser {
  final AuthRepository repository;

  RegisterUserImpl(this.repository);

  @override
  Future<Either<Exception, AuthResponse>> call({
    required String email,
    required String password,
  }) async {
    try {
      return Right(
        await repository.registerUser(
          email: email,
          password: password,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return Left(Exception(e.toString()));
    }
  }
}
