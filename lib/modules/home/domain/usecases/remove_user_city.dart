import 'package:dartz/dartz.dart';

import '../repositories/user_cities_repository.dart';

abstract class RemoveUserCity {
  Future<Either<Exception, void>> call(int cityId);
}

class RemoveUserCityImpl implements RemoveUserCity {
  final UserCitiesRepository repository;

  RemoveUserCityImpl(this.repository);

  @override
  Future<Either<Exception, void>> call(int cityId) async {
    try {
      return Right(
        await repository.removeUserCity(cityId),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
