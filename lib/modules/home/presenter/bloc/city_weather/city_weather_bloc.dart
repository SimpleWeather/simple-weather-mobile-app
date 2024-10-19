import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/utils/filter_by_word_start.dart';
import '../../../domain/models/city_weather.dart';
import '../../../domain/models/weather.dart';
import '../../../domain/usecases/get_saved_cities.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  CityWeatherBloc() : super(CityWeatherInitialState()) {
    on<FetchCityWeatherEvent>(_fetchCityWeather);

    on<FetchSavedCitiesWeatherEvent>(_fetchSavedCities);

    on<SearchCityEvent>(_searchCity);
  }

  // Mock
  CityWeatherFetch savedCities = CityWeatherFetch([
    CityWeather(
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
    CityWeather(
      city: 'São Paulo',
      minTemperature: 23,
      maxTemperature: 28,
      feelsLike: 24,
      humidity: .8,
      temperature: 24,
      weather: WeatherFetch(
        [
          Weather(
            mainText: 'Nuvens',
            description: '',
          ),
        ],
      ),
    ),
  ]);

  Future<void> _fetchCityWeather(
    FetchCityWeatherEvent event,
    emit,
  ) async {
    emit(CityWeatherLoadingState());
  }

  Future<void> _fetchSavedCities(
    FetchSavedCitiesWeatherEvent event,
    emit,
  ) async {
    emit(CityWeatherLoadingState());

    emit(
      (await Modular.get<GetSavedCities>()()).fold(
        (exception) => CityWeatherErrorState(exception.toString()),
        (cities) {
          // savedCities = cities;

          return SavedCityWeatherSuccessState(savedCities);
        },
      ),
    );
  }

  void _searchCity(
    SearchCityEvent event,
    emit,
  ) {
    emit(CityWeatherLoadingState());

    final found = CityWeatherFetch(
      filterByWordStart(
        savedCities.content,
        (field) => field.city.toLowerCase(),
        event.cityQuery,
      ),
    );

    if (found.content.isNotEmpty) {
      emit(
        SavedCityWeatherSuccessState(
          found,
        ),
      );
      return;
    }

    emit(
      SavedCityWeatherSuccessState(
        savedCities,
      ),
    );
  }
}
