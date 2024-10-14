import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_weather/modules/home/domain/models/city_weather.dart';

import '../../infra/drivers/weather_driver.dart';

class WeatherDriverImpl implements WeatherDriver {
  @override
  Future<void> saveCity(CityWeather city) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'savedCities',
      city.toJson(),
    );
  }

  @override
  Future<CityWeatherFetch?> getSavedCities() async {
    final prefs = await SharedPreferences.getInstance();

    final cities = prefs.getString('savedCities');

    if (cities == null) return null;

    return CityWeatherFetch.fromJson(cities);
  }
}
