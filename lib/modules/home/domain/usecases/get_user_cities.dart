import 'package:dartz/dartz.dart';

import '../models/user_city.dart';
import '../repositories/user_cities_repository.dart';

abstract class GetUserCities {
  Future<Either<Exception, UserCityFetch>> call(String userId);
}

class GetUserCitiesImpl implements GetUserCities {
  final UserCitiesRepository repository;

  GetUserCitiesImpl(this.repository);

  @override
  Future<Either<Exception, UserCityFetch>> call(String userId) async {
    try {
      return Right(
        await repository.getUserCities(userId),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
