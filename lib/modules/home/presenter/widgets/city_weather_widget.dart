import 'package:flutter/material.dart';

import '../../domain/models/city_weather.dart';

class CityWeatherWidget extends StatefulWidget {
  final CityWeather cityWeather;

  const CityWeatherWidget({
    super.key,
    required this.cityWeather,
  });

  @override
  State<CityWeatherWidget> createState() => _CityWeatherWidgetState();
}

class _CityWeatherWidgetState extends State<CityWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        widget.cityWeather.city,
      ),
      subtitle: widget.cityWeather.weather.content.isEmpty
          ? null
          : Text(
              widget.cityWeather.weather.content.first.mainText,
            ),
      trailing: Column(
        children: [
          Text(
            '${widget.cityWeather.minTemperature} °C',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueAccent[800],
            ),
          ),
          Text(
            '${widget.cityWeather.maxTemperature} °C',
            style: TextStyle(
              fontSize: 18,
              color: Colors.red[900],
            ),
          ),
        ],
      ),
    );
  }
}
