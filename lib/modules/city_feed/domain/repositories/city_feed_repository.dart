import '../../../home/domain/models/city_weather.dart';
import '../models/city_feed_interaction.dart';
import '../models/new_city_feed_interaction.dart';

abstract class CityFeedRepository {
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  });

  Future<void> saveCityToFeed(CityWeather city);

  Future<CityFeedInteractionFetch> getCityFeedInteractions(int cityId);

  Future<CityFeedInteraction?> createCityFeedInteraction(
    NewCityFeedInteraction interaction,
  );
}
