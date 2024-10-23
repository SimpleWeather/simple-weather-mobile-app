import '../../domain/models/user_city.dart';

abstract class UserCitiesDatasource {
  Future<UserCityFetch> getUserCities(String userId);
}
