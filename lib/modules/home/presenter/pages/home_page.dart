import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_weather/modules/home/presenter/bloc/city_weather/city_weather_bloc.dart';

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
  void initState() {
    viewModel.fetchSavedCities();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: BlocBuilder(
            bloc: viewModel.bloc,
            builder: (context, state) {
              if (state is SavedCityWeatherSuccessState) {
                final cities = state.cities.content;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchCityWidget(
                      onSearch: viewModel.searchCity,
                    ),
                    if (cities.isEmpty)
                      const Center(
                        heightFactor: 6,
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 28,
                            ),
                            Text(
                                'Não foi possível encontrar a(s) cidade(s) bucada(s).'),
                          ],
                        ),
                      )
                    else ...{
                      const SizedBox(height: 14),
                      Expanded(
                        child: ListView.separated(
                          itemCount: cities.length,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemBuilder: (_, index) {
                            final cityWeather = cities[index];

                            return CityWeatherWidget(
                              cityWeather: cityWeather,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                    },
                  ],
                );
              }

              return const SizedBox.shrink();
            }),
      ),
    );
  }
}
