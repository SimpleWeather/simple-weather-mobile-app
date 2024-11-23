import '../../../home/domain/models/city_weather.dart';
import '../../domain/models/city_feed_interaction.dart';
import '../../domain/models/new_city_feed_interaction.dart';

abstract class CityFeedDatasource {
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  });

  Future<void> saveCityToFeed(CityWeather city);

  Future<CityFeedInteractionFetch> getCityFeedInteractions(int cityId);

  Future<CityFeedInteraction?> createCityFeedInteraction(
    NewCityFeedInteraction interaction,
  );

  Future<void> deleteCityFeedInteraction(
    String interactionId,
  );
}
