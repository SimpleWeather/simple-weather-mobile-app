import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../city_feed/presenter/bloc/city_weather/city_feed_bloc.dart';

class AddCityToFeedPage extends StatefulWidget {
  final String searchedCity;

  const AddCityToFeedPage({
    super.key,
    required this.searchedCity,
  });

  @override
  State<AddCityToFeedPage> createState() => _AddCityToFeedPageState();
}

class _AddCityToFeedPageState extends State<AddCityToFeedPage> {
  late final bloc = Modular.get<CityFeedBloc>()
    ..add(
      FetchCityWeatherEvent(
        cityName: widget.searchedCity,
      ),
    );

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (_, state) {
        if (state is SavedCityToFeedSuccessState) {
          Navigator.pop(context, true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
          title: Text(
            widget.searchedCity,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            BlocBuilder(
                bloc: bloc,
                builder: (_, state) {
                  if (state is CityWeatherSuccessState) {
                    return IconButton(
                      onPressed: () => bloc.add(
                        AddCityToFeedEvent(
                          state.cityWeather,
                        ),
                      ),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                }),
          ],
        ),
        body: BlocBuilder(
          bloc: bloc,
          builder: (_, state) {
            if (state is CityWeatherSuccessState) {
              final cityWeather = state.cityWeather;

              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Icon(
                      cityWeather.weatherIcon,
                      size: 42,
                    ),
                    const SizedBox(height: 12),
                    const Text('Máxima:'),
                    Text(
                      '${cityWeather.maxTemperature.toStringAsPrecision(2)} °C',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('Mínima:'),
                    Text(
                      '${cityWeather.minTemperature.toStringAsPrecision(2)} °C',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Sensação térmica de: ${cityWeather.feelsLike.toStringAsPrecision(2)} °C',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
