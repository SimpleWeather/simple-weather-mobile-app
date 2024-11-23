import 'package:simple_weather/modules/city_feed/domain/models/city_feed_interaction.dart';
import 'package:simple_weather/modules/city_feed/domain/models/new_city_feed_interaction.dart';
import 'package:simple_weather/modules/home/domain/models/city_weather.dart';

import '../../domain/repositories/city_feed_repository.dart';
import '../datasources/city_feed_datasource.dart';

class CityFeedRepositoryImpl implements CityFeedRepository {
  final CityFeedDatasource datasource;

  CityFeedRepositoryImpl(
    this.datasource,
  );

  @override
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  }) async =>
      datasource.getCityWeather(
        cityName,
        uf: uf,
      );

  @override
  Future<CityFeedInteractionFetch> getCityFeedInteractions(
    int cityId,
  ) async =>
      datasource.getCityFeedInteractions(
        cityId,
      );

  @override
  Future<void> saveCityToFeed(CityWeather city) async =>
      datasource.saveCityToFeed(
        city,
      );

  @override
  Future<CityFeedInteraction?> createCityFeedInteraction(
    NewCityFeedInteraction interaction,
  ) async =>
      datasource.createCityFeedInteraction(
        interaction,
      );

  @override
  Future<void> deleteCityFeedInteraction(
    String interactionId,
  ) async =>
      datasource.deleteCityFeedInteraction(
        interactionId,
      );
}
