import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/city_weather.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  CityWeatherBloc() : super(CityWeatherInitialState()) {
    on<FetchCityWeatherEvent>(_fetchCityWeather);
  }

  Future<void> _fetchCityWeather(
    FetchCityWeatherEvent event,
    emit,
  ) async {
    emit(CityWeatherLoadingState());
  }
}
