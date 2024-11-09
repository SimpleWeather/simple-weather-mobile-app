import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/city_weather_constants.dart';
import 'weather.dart';

class CityWeatherFetch {
  List<CityWeather> content = [];

  CityWeatherFetch(List<CityWeather> list) {
    content = list;
  }

  factory CityWeatherFetch.fromJson(json) => CityWeatherFetch(
        (json as List).map(CityWeather.fromJson).toList(),
      );

  List<Map<String, dynamic>> toMapList() => content
      .map(
        (city) => city._toMap(),
      )
      .toList();

  String toJson() => jsonEncode(toMapList());

  bool containsCity(String city) => content.any(
        (cityWeather) => cityWeather.city == city,
      );
}

class CityWeather {
  final int id;
  final WeatherFetch weather;
  final double temperature;
  final double feelsLike;
  final double maxTemperature;
  final double minTemperature;
  final double humidity;
  final String city;

  CityWeather({
    required this.id,
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

  IconData? get weatherIcon {
    final mainText = weather.content.firstOrNull?.mainText;

    if (mainText == null) return null;

    return switch (mainText.toLowerCase()) {
      'rain' => Icons.sunny_snowing,
      'snow' => Icons.snowing,
      'clouds' => Icons.cloud_outlined,
      'clear' => Icons.circle_outlined,
      String() => null,
    };
  }

  Map<String, dynamic> _toMap() => {
        CityWeatherConstants.weather: weather.toJson(),
        CityWeatherConstants.city: city,
        CityWeatherConstants.main: {
          CityWeatherConstants.feelsLike: feelsLike,
          CityWeatherConstants.temp: temperature,
          CityWeatherConstants.minTemperature: minTemperature,
          CityWeatherConstants.maxTemperature: maxTemperature,
          CityWeatherConstants.humidity: humidity,
        },
      };

  Map<String, dynamic> toCityMap() => {
        'id': id,
        'name': city,
        'temperature': temperature,
        'feelsLike': feelsLike,
        'maxTemperature': maxTemperature,
        'minTemperature': minTemperature,
        'humidity': humidity,
        'mainWeather': weather.content.first.mainText,
        'weatherDescription': weather.content.first.description,
      };

  Map<String, dynamic> toUserCityFeedMap({
    required DateTime addedAt,
    required String userId,
    String? uf,
  }) =>
      {
        'cityId': id,
        'city': city,
        'addedAt': addedAt.toIso8601String(),
        'userId': userId,
        'uf': uf,
      };

  String toJson() => jsonEncode(_toMap());

  factory CityWeather.fromJson(json) {
    final main = json[CityWeatherConstants.main];

    return CityWeather(
      id: json[CityWeatherConstants.id],
      weather: WeatherFetch.fromJson(
        json[CityWeatherConstants.weather],
      ),
      temperature: main[CityWeatherConstants.temp],
      feelsLike: main[CityWeatherConstants.feelsLike],
      maxTemperature: _convert(
        main[CityWeatherConstants.maxTemperature].toString(),
      ),
      minTemperature: _convert(
        main[CityWeatherConstants.minTemperature].toString(),
      ),
      humidity: (main[CityWeatherConstants.humidity] as int).toDouble(),
      city: json[CityWeatherConstants.name],
    );
  }
}
