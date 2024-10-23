import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../city_weather/presenter/bloc/city_weather/city_weather_bloc.dart';
import '../bloc/saved_city_weather/saved_city_weather_bloc.dart';

abstract class HomeViewModel {
  abstract final SavedCityWeatherBloc bloc;

  abstract final CityWeatherBloc cityWeatherBloc;

  abstract bool showSearch;

  abstract final TextEditingController textController;

  bool get validateSearch;

  void fetchUserCities();

  void searchCity(String query);

  void searchNewCity();
}

class HomeViewModelImpl implements HomeViewModel {
  @override
  final bloc = Modular.get<SavedCityWeatherBloc>();

  @override
  final cityWeatherBloc = Modular.get<CityWeatherBloc>();

  @override
  final textController = TextEditingController();

  @override
  bool showSearch = false;

  @override
  bool get validateSearch => textController.text.isNotEmpty && showSearch;

  @override
  void fetchUserCities() {
    String userId = '';
    bloc.add(FetchSavedCitiesWeatherEvent(userId));
  }

  @override
  void searchCity(String query) {
    bloc.add(SearchCityEvent(query));
  }

  @override
  void searchNewCity() {
    cityWeatherBloc.add(
      FetchCityWeatherEvent(
        cityName: (bloc.query),
      ),
    );
  }
}
