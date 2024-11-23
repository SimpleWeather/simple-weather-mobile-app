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
  final viewModel = Modular.get<HomeViewModel>()..fetchUserCities();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text(
          'Weather IO',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: BlocBuilder(
            bloc: viewModel.bloc,
            builder: (context, state) {
              if (state is SavedCityWeatherErrorState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.info_outline,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              if (state is SavedCityWeatherSuccessState) {
                final cities = state.cities.cities;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchCityWidget(
                        onSearch: viewModel.searchCity,
                        showSearch: viewModel.showSearch,
                        controller: viewModel.textController,
                        onTap: () => setState(() {
                          viewModel.showSearch = true;
                        }),
                        onCloseTap: () => setState(viewModel.closeSearch),
                      ),
                      if (cities.isEmpty)
                        Center(
                          heightFactor: 4,
                          child: Column(
                            children: [
                              const Icon(
                                Icons.search_off,
                                size: 28,
                              ),
                              const Text(
                                  'Não foi possível encontrar a(s) cidade(s) buscada(s).'),
                              if (viewModel.textController.text.isNotEmpty)
                                TextButton(
                                  onPressed: () => Modular.to
                                      .pushNamed(
                                    './addCityToFeedPage',
                                    arguments: viewModel.textController.text,
                                  )
                                      .then((result) {
                                    if (result != null) {
                                      viewModel.fetchUserCities();
                                    }
                                  }),
                                  child: const Text('Busca avançada'),
                                ),
                            ],
                          ),
                        )
                      else ...{
                        const SizedBox(height: 14),
                        ListView.separated(
                          itemCount: cities.length,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemBuilder: (_, index) {
                            final city = cities[index];

                            return CityWeatherWidget(
                              userCity: city,
                              onDeleteTap: () => viewModel.bloc.add(
                                RemoveUserCityEvent(
                                  city.cityId,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                      },
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            }),
      ),
    );
  }
}
