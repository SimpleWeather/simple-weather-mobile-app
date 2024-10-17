part of 'city_weather_bloc.dart';

abstract class CityWeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCityWeatherEvent extends CityWeatherEvent {
  final String cityName;
  final String? uf;

  FetchCityWeatherEvent({
    required this.cityName,
    this.uf,
  });
}

class FetchSavedCitiesWeatherEvent extends CityWeatherEvent {}

class SearchCityEvent extends CityWeatherEvent {
  final String cityQuery;

  SearchCityEvent(this.cityQuery);
}
