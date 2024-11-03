import 'package:simple_weather/modules/home/domain/models/city_weather.dart';

import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource datasource;

  WeatherRepositoryImpl(
    this.datasource,
  );

  @override
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  }) async =>
      datasource.getCityWeather(
        cityName,
        uf: uf,
      );
}
