import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/repositories/auth_repository.dart';

abstract class LoginUser {
  Future<Either<Exception, AuthResponse>> call({
    required String email,
    required String password,
  });
}

class LoginUserImpl implements LoginUser {
  final AuthRepository repository;

  LoginUserImpl(this.repository);

  @override
  Future<Either<Exception, AuthResponse>> call({
    required String email,
    required String password,
  }) async {
    try {
      return Right(
        await repository.loginUser(
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
