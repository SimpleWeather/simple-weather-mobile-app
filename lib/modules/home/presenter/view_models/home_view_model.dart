import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../bloc/saved_city_weather/saved_city_weather_bloc.dart';

abstract class HomeViewModel {
  abstract final SavedCityWeatherBloc bloc;

  abstract bool showSearch;

  abstract final TextEditingController textController;

  bool get validateSearch;

  void fetchUserCities();

  void searchCity(String query);

  void closeSearch();
}

class HomeViewModelImpl implements HomeViewModel {
  @override
  final bloc = Modular.get<SavedCityWeatherBloc>();

  @override
  final textController = TextEditingController();

  @override
  bool showSearch = false;

  @override
  bool get validateSearch => textController.text.isNotEmpty && showSearch;

  @override
  void fetchUserCities() {
    String userId = Supabase.instance.client.auth.currentUser!.id;
    bloc.add(FetchSavedCitiesWeatherEvent(userId));
  }

  @override
  void searchCity(String query) {
    bloc.add(SearchCityEvent(query));
  }

  @override
  void closeSearch() {
    showSearch = false;
    textController.clear();
    searchCity(textController.text);
  }
}
