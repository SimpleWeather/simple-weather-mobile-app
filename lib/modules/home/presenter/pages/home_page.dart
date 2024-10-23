import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/saved_city_weather/saved_city_weather_bloc.dart';
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
    viewModel.fetchUserCities();

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
        child: BlocConsumer(
            bloc: viewModel.bloc,
            listener: (_, state) {},
            builder: (context, state) {
              if (state is SavedCityWeatherSuccessState) {
                final cities = state.cities.cities;

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
                                'Não foi possível encontrar a(s) cidade(s) buscada(s).'),
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
                            final userCity = cities[index];

                            return CityWeatherWidget(
                              userCity: userCity,
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
