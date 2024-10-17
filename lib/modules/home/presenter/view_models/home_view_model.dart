import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/city_weather/city_weather_bloc.dart';

abstract class HomeViewModel {
  abstract final CityWeatherBloc bloc;

  abstract bool showSearch;

  abstract final TextEditingController textController;

  bool get validateSearch;

  void fetchSavedCities();

  void searchCity(String query);
}

class HomeViewModelImpl implements HomeViewModel {
  @override
  final bloc = Modular.get<CityWeatherBloc>();

  @override
  final textController = TextEditingController();

  @override
  bool showSearch = false;

  @override
  bool get validateSearch => textController.text.isNotEmpty && showSearch;

  @override
  void fetchSavedCities() {
    bloc.add(FetchSavedCitiesWeatherEvent());
  }

  @override
  void searchCity(String query) {
    bloc.add(SearchCityEvent(query));
  }
}
