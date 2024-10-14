import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/models/city_weather.dart';
import '../../domain/models/weather.dart';
import '../view_models/home_view_model.dart';
import '../widgets/city_weather_widget.dart';
import '../widgets/search_city_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = Modular.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Weather'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: SearchCityWidget(),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return CityWeatherWidget(
                  cityWeather: CityWeather(
                    city: 'Salvador',
                    minTemperature: 27,
                    maxTemperature: 33,
                    feelsLike: 28,
                    humidity: .5,
                    temperature: 29,
                    weather: WeatherFetch(
                      [
                        Weather(
                          mainText: 'Muito quente',
                          description: 'Quente',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
