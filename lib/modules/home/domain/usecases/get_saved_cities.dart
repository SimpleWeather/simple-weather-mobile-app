import 'package:dartz/dartz.dart';

import '../../infra/drivers/weather_driver.dart';
import '../models/city_weather.dart';

abstract class GetSavedCities {
  Future<Either<Exception, CityWeatherFetch>> call();
}

class GetSavedCitiesImpl implements GetSavedCities {
  final WeatherDriver driver;

  GetSavedCitiesImpl(this.driver);

  @override
  Future<Either<Exception, CityWeatherFetch>> call() async {
    try {
      return Right(
        await driver.getSavedCities(),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
