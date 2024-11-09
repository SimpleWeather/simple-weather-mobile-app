part of 'city_feed_bloc.dart';

abstract class CityFeedState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CityFeedInitialState extends CityFeedState {}

final class CityFeedLoadingState extends CityFeedState {}

final class CityWeatherSuccessState extends CityFeedState {
  final CityWeather cityWeather;

  CityWeatherSuccessState(this.cityWeather);

  @override
  List<Object?> get props => [
        cityWeather,
      ];
}

final class CityFeedSuccessState extends CityFeedState {
  final CityFeedInteractionFetch cityFeedInteractions;

  CityFeedSuccessState(this.cityFeedInteractions);

  @override
  List<Object?> get props => [
        cityFeedInteractions,
      ];
}

final class CityFeedErrorState extends CityFeedState {
  final String message;

  CityFeedErrorState(this.message);
}
