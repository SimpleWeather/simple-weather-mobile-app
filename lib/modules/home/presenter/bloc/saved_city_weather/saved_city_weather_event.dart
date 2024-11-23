part of 'saved_city_weather_bloc.dart';

sealed class SavedCityWeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchSavedCitiesWeatherEvent extends SavedCityWeatherEvent {
  final String userId;

  FetchSavedCitiesWeatherEvent(this.userId);
}

final class SearchCityEvent extends SavedCityWeatherEvent {
  final String cityQuery;

  SearchCityEvent(this.cityQuery);
}

final class RemoveUserCityEvent extends SavedCityWeatherEvent {
  final String id;

  RemoveUserCityEvent(this.id);
}
