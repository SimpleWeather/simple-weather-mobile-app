import 'weather.dart';

class CityWeather {
  final Weather weather;
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
}
