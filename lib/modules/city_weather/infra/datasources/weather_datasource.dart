import '../../../home/domain/models/city_weather.dart';

abstract class WeatherDatasource {
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  });
}
