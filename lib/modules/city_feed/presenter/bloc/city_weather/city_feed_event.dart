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

final class FetchCityFeedInfoEvent extends CityFeedEvent {
  final int cityId;
  final String cityName;
  final String? uf;

  FetchCityFeedInfoEvent({
    required this.cityId,
    required this.cityName,
    this.uf,
  });

  @override
  List<Object?> get props => [
        cityId,
        cityName,
        uf,
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

final class AddCityFeedInteraction extends CityFeedEvent {
  final int cityId;
  final String content;

  AddCityFeedInteraction({
    required this.cityId,
    required this.content,
  });

  @override
  List<Object?> get props => [
        cityId,
        content,
      ];
}

final class DeleteCityFeedInteraction extends CityFeedEvent {
  final String interactionId;

  DeleteCityFeedInteraction(this.interactionId);

  @override
  List<Object?> get props => [
        interactionId,
      ];
}
