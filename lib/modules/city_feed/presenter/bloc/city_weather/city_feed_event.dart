part of 'city_feed_bloc.dart';

sealed class CityFeedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchCityWeatherEvent extends CityFeedEvent {
  final String cityName;
  final String? uf;

  FetchCityWeatherEvent({
    required this.cityName,
    this.uf,
  });

  @override
  List<Object?> get props => [
        '$cityName-${uf ?? 'unknown-uf'}',
      ];
}

final class FetchCityFeedInteractionsEvent extends CityFeedEvent {
  final int cityId;

  FetchCityFeedInteractionsEvent(this.cityId);

  @override
  List<Object?> get props => [
        cityId,
      ];
}

final class AddCityToFeedEvent extends CityFeedEvent {
  final CityWeather city;

  AddCityToFeedEvent(this.city);

  @override
  List<Object?> get props => [
        city,
      ];
}
