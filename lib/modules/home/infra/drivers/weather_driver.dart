import '../../domain/models/city_weather.dart';

abstract class WeatherDriver {
  Future<void> saveCity(CityWeather city);

  Future<CityWeatherFetch?> getSavedCities();
}
