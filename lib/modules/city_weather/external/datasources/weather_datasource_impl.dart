import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:simple_weather/modules/home/domain/models/city_weather.dart';

import '../../../../core/env/env.dart';
import '../../../../core/utils/app_utils.dart';
import '../../infra/datasources/weather_datasource.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  final Client client;

  WeatherDatasourceImpl(this.client);

  @override
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  }) async {
    final response = await client.get(Uri.parse(
      AppUtils.baseUrl(
        city: cityName,
        uf: uf ?? 'br',
        apiKey: Env.apiKey,
      ),
    ));

    if (response.statusCode != 200) return null;

    if (kDebugMode) {
      print(jsonDecode(
        utf8.decode(
          response.bodyBytes,
        ),
      ));
    }

    return CityWeather.fromJson(
      jsonDecode(
        utf8.decode(
          response.bodyBytes,
        ),
      ),
    );
  }
}
