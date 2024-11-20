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
          title: Text(widget.searchedCity),
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

              return Column(
                children: [
                  Text(cityWeather.id.toString()),
                  Text('Feels like: ${cityWeather.feelsLike}'),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
