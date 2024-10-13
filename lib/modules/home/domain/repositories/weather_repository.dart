import '../models/city_weather.dart';

abstract class WeatherRepository {
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  });
}
