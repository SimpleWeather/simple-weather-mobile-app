part of 'saved_city_weather_bloc.dart';

abstract class SavedCityWeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchSavedCitiesWeatherEvent extends SavedCityWeatherEvent {
  final String userId;

  FetchSavedCitiesWeatherEvent(this.userId);
}

class SearchCityEvent extends SavedCityWeatherEvent {
  final String cityQuery;

  SearchCityEvent(this.cityQuery);
}
