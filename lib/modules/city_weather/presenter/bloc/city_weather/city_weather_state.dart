part of '../../../../city_weather/presenter/bloc/city_weather/city_weather_bloc.dart';

abstract class CityWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CityWeatherInitialState extends CityWeatherState {}

class CityWeatherLoadingState extends CityWeatherState {}

class CityWeatherSuccessState extends CityWeatherState {
  final CityWeather cityWeather;

  CityWeatherSuccessState(this.cityWeather);

  @override
  List<Object?> get props => [
        cityWeather.city.trim().toLowerCase(),
        cityWeather.hashCode,
      ];
}

class CityWeatherErrorState extends CityWeatherState {
  final String message;

  CityWeatherErrorState(this.message);
}
