import '../constants/weather_constants.dart';

class WeatherFetch {
  List<Weather> content = [];

  WeatherFetch(List<Weather> list) {
    content = list;
  }

  factory WeatherFetch.fromJson(json) => WeatherFetch(
        (json as List).map(Weather.fromJson).toList(),
      );
}

class Weather {
  final String mainText;
  final String description;

  Weather({
    required this.mainText,
    required this.description,
  });

  factory Weather.fromJson(json) => Weather(
        mainText: json[WeatherConstants.main],
        description: json[WeatherConstants.description],
      );
}
