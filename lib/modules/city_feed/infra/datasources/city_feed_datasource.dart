import '../../../home/domain/models/city_weather.dart';
import '../../domain/models/city_feed_interaction.dart';

abstract class CityFeedDatasource {
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  });

  Future<void> saveCityToFeed(CityWeather city);

  Future<CityFeedInteractionFetch> getCityFeedInteractions(int cityId);
}
