import '../constants/city_weather_constants.dart';
import 'weather.dart';

class CityWeather {
  final WeatherFetch weather;
  final double temperature;
  final double feelsLike;
  final double maxTemperature;
  final double minTemperature;
  final double humidity;
  final String city;

  CityWeather({
    required this.weather,
    required this.temperature,
    required this.feelsLike,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
    required this.city,
  });

  static double get _kelvin => 273.15;

  static double _convert(String temp) => double.tryParse(temp) ?? 0 - _kelvin;

  factory CityWeather.fromJson(json) {
    final main = json[CityWeatherConstants.main];

    return CityWeather(
      weather: WeatherFetch.fromJson(
        json[CityWeatherConstants.weather],
      ),
      temperature: main[CityWeatherConstants.temp],
      feelsLike: main[CityWeatherConstants.feelsLike],
      maxTemperature: _convert(main[CityWeatherConstants.maxTemperature]),
      minTemperature: _convert(main[CityWeatherConstants.minTemperature]),
      humidity: main[CityWeatherConstants.humidity],
      city: json[CityWeatherConstants.city],
    );
  }
}
