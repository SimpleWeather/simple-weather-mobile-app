import 'package:dartz/dartz.dart';

import '../../../home/domain/models/city_weather.dart';
import '../repositories/weather_repository.dart';

abstract class GetCityWeather {
  Future<Either<Exception, CityWeather>> call(
    String cityName, {
    String? uf,
  });
}

class GetCityWeatherImpl implements GetCityWeather {
  final WeatherRepository repository;

  GetCityWeatherImpl(this.repository);

  @override
  Future<Either<Exception, CityWeather>> call(
    String cityName, {
    String? uf,
  }) async {
    try {
      final city = await repository.getCityWeather(cityName, uf: uf);

      if (city == null) {
        return Left(Exception('Não foi possível encontrar cidade.'));
      }

      return Right(city);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
