import '../models/user_city.dart';

abstract class UserCitiesRepository {
  Future<UserCityFetch> getUserCities(String userId);

  Future<void> removeUserCity(int cityId);
}
