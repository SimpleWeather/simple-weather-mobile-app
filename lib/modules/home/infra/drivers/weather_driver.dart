import '../../domain/models/city_weather.dart';

abstract class WeatherDriver {
  Future<void> saveCities(CityWeatherFetch cities);

  Future<CityWeatherFetch> getSavedCities();
}
