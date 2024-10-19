import 'package:dartz/dartz.dart';

import '../../infra/drivers/weather_driver.dart';
import '../models/city_weather.dart';
import 'get_saved_cities.dart';

abstract class SaveCity {
  Future<Either<Exception, void>> call(CityWeather city);
}

class SaveCityImpl implements SaveCity {
  final GetSavedCities getSavedCities;
  final WeatherDriver driver;

  SaveCityImpl(
    this.getSavedCities,
    this.driver,
  );

  @override
  Future<Either<Exception, void>> call(CityWeather city) async {
    try {
      final savedCities = (await getSavedCities()).fold(
        (_) => null,
        (cities) => cities,
      );

      if (savedCities != null) {
        final updated = CityWeatherFetch(
          [...savedCities.content, city],
        );

        return Right(
          await driver.saveCities(updated),
        );
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }

    return Left(Exception());
  }
}
