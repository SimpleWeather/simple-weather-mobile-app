import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:simple_weather/modules/city_feed/domain/models/city_feed_interaction.dart';
import 'package:simple_weather/modules/home/domain/models/city_weather.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/env/env.dart';
import '../../../../core/utils/app_utils.dart';
import '../../infra/datasources/city_feed_datasource.dart';

class CityFeedDatasourceImpl implements CityFeedDatasource {
  final Client client;

  CityFeedDatasourceImpl(this.client);

  @override
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  }) async {
    final response = await client.get(
      Uri.parse(
        AppUtils.baseUrl(
          city: cityName,
          uf: uf ?? 'br',
          apiKey: Env.apiKey,
        ),
      ),
    );

    if (response.statusCode != 200) return null;

    final decoded = jsonDecode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    if (kDebugMode) {
      print(decoded);
    }

    return CityWeather.fromJson(decoded);
  }

  @override
  Future<CityFeedInteractionFetch> getCityFeedInteractions(
    int cityId,
  ) async {
    final client = Supabase.instance.client;

    final response = await client.from('city_feed_interaction').select().eq(
          'cityId',
          cityId,
        );

    if (response.isEmpty) return CityFeedInteractionFetch([]);

    return CityFeedInteractionFetch.fromMap(
      response,
    );
  }

  @override
  Future<void> saveCityToFeed(CityWeather city) async {
    final supabaseClient = Supabase.instance.client;

    final hasCity =
        (await supabaseClient.from('cities').select().eq('id', city.id))
            .isNotEmpty;

    if (!hasCity) {
      await supabaseClient.from('cities').insert(
            city.toCityMap(),
          );
    }

    await supabaseClient.from('user_cities').insert(
          city.toUserCityFeedMap(
            addedAt: DateTime.now(),
            userId: supabaseClient.auth.currentUser!.id,
          ),
        );
  }
}
