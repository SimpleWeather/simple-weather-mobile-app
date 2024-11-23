import 'package:simple_weather/modules/home/domain/models/user_city.dart';

import '../../domain/repositories/user_cities_repository.dart';
import '../datasources/user_cities_datasource.dart';

class UserCitiesRepositoryImpl implements UserCitiesRepository {
  final UserCitiesDatasource datasource;

  UserCitiesRepositoryImpl(this.datasource);

  @override
  Future<UserCityFetch> getUserCities(String userId) async =>
      datasource.getUserCities(
        userId,
      );

  @override
  Future<void> removeUserCity(
    int cityId,
  ) async =>
      datasource.removeUserCity(
        cityId,
      );
}
