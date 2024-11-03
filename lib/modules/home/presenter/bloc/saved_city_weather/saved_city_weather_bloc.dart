import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/utils/filter_by_word_start.dart';
import '../../../domain/models/user_city.dart';
import '../../../domain/usecases/get_user_cities.dart';

part 'saved_city_weather_event.dart';
part 'saved_city_weather_state.dart';

class SavedCityWeatherBloc
    extends Bloc<SavedCityWeatherEvent, SavedCityWeatherState> {
  SavedCityWeatherBloc() : super(SavedCityWeatherInitialState()) {
    on<FetchSavedCitiesWeatherEvent>(_fetchSavedCities);

    on<SearchCityEvent>(_searchCity);
  }

  UserCityFetch savedCities = UserCityFetch([]);

  String query = '';

  Future<void> _fetchSavedCities(
    FetchSavedCitiesWeatherEvent event,
    emit,
  ) async {
    emit(SavedCityWeatherLoadingState());

    emit(
      (await Modular.get<GetUserCities>()(event.userId)).fold(
        (exception) => SavedCityWeatherErrorState(exception.toString()),
        (cities) {
          savedCities = cities;

          return SavedCityWeatherSuccessState(savedCities);
        },
      ),
    );
  }

  void _searchCity(
    SearchCityEvent event,
    emit,
  ) {
    emit(SavedCityWeatherLoadingState());

    query = event.cityQuery;

    final found = UserCityFetch(
      filterByWordStart(
        savedCities.cities,
        (field) => field.city.toLowerCase(),
        event.cityQuery,
      ),
    );

    if (found.cities.isNotEmpty) {
      emit(
        SavedCityWeatherSuccessState(
          found,
        ),
      );
      return;
    }

    emit(
      SavedCityWeatherSuccessState(
        event.cityQuery.isEmpty ? savedCities : found,
      ),
    );
  }
}
