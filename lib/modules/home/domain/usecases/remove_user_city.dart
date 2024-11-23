import 'package:dartz/dartz.dart';

import '../repositories/user_cities_repository.dart';

abstract class RemoveUserCity {
  Future<Either<Exception, void>> call(String id);
}

class RemoveUserCityImpl implements RemoveUserCity {
  final UserCitiesRepository repository;

  RemoveUserCityImpl(this.repository);

  @override
  Future<Either<Exception, void>> call(String id) async {
    try {
      return Right(
        await repository.removeUserCity(id),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
