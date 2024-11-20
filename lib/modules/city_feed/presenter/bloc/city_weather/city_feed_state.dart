part of 'city_feed_bloc.dart';

abstract class CityFeedState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CityFeedInitialState extends CityFeedState {}

final class CityFeedLoadingState extends CityFeedState {}

final class SavedCityToFeedSuccessState extends CityFeedState {}

final class CityWeatherSuccessState extends CityFeedState {
  final CityWeather cityWeather;

  CityWeatherSuccessState(this.cityWeather);

  @override
  List<Object?> get props => [
        cityWeather,
      ];
}

final class CityFeedInfoSuccessState extends CityFeedState {
  final CityFeedInteractionFetch cityFeedInteractions;
  final CityWeather? cityWeather;

  CityFeedInfoSuccessState({
    required this.cityFeedInteractions,
    required this.cityWeather,
  });

  @override
  List<Object?> get props => [
        cityFeedInteractions,
        cityWeather,
      ];
}

final class CityFeedErrorState extends CityFeedState {
  final String message;

  CityFeedErrorState(this.message);
}
