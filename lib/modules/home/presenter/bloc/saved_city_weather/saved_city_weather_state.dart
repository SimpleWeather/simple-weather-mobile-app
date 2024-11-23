part of 'saved_city_weather_bloc.dart';

abstract class SavedCityWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SavedCityWeatherInitialState extends SavedCityWeatherState {}

class SavedCityWeatherLoadingState extends SavedCityWeatherState {}

class SavedCityWeatherSuccessState extends SavedCityWeatherState {
  final UserCityFetch cities;

  SavedCityWeatherSuccessState(this.cities);
}

class SavedCityWeatherErrorState extends SavedCityWeatherState {
  final String message;

  SavedCityWeatherErrorState(this.message);
}
