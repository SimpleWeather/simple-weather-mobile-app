import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/models/user_city.dart';
import '../../infra/datasources/user_cities_datasource.dart';

class UserCitiesDatasourceImpl implements UserCitiesDatasource {
  @override
  Future<UserCityFetch> getUserCities(String userId) async {
    final client = Supabase.instance.client;

    final response =
        await client.from('user_cities').select().eq('userId', userId);

    if (response.isEmpty) {
      return UserCityFetch([]);
    }

    return UserCityFetch.fromMap(response);
  }

  @override
  Future<void> removeUserCity(String id) async {
    final client = Supabase.instance.client;

    await client.from('user_cities').delete().eq('id', id);
  }
}
