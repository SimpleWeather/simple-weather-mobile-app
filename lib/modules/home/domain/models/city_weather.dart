import '../constants/city_weather_constants.dart';
import 'weather.dart';

class CityWeather {
  final WeatherFetch weather;
  final double temperature;
  final double feelsLike;
  final double maxTemperature;
  final double minTemperature;
  final double humidity;

  CityWeather({
    required this.weather,
    required this.temperature,
    required this.feelsLike,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
  });

  factory CityWeather.fromJson(json) {
    final main = json[CityWeatherConstants.main];

    return CityWeather(
      weather: WeatherFetch.fromJson(
        json[CityWeatherConstants.weather],
      ),
      temperature: main[CityWeatherConstants.temp],
      feelsLike: main[CityWeatherConstants.feelsLike],
      maxTemperature: main[CityWeatherConstants.maxTemperature],
      minTemperature: main[CityWeatherConstants.minTemperature],
      humidity: main[CityWeatherConstants.humidity],
    );
  }
}
