import 'package:dartz/dartz.dart';

import '../../../home/domain/models/city_weather.dart';
import '../repositories/city_feed_repository.dart';

abstract class SaveCityToFeed {
  Future<Either<Exception, void>> call(CityWeather city);
}

class SaveCityToFeedImpl implements SaveCityToFeed {
  final CityFeedRepository repository;

  SaveCityToFeedImpl(this.repository);

  @override
  Future<Either<Exception, void>> call(
    CityWeather city,
  ) async {
    try {
      return Right(
        await repository.saveCityToFeed(
          city,
        ),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
