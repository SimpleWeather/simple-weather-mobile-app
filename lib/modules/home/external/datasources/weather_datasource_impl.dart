import 'dart:convert';

import 'package:http/http.dart';
import 'package:simple_weather/modules/home/domain/models/city_weather.dart';

import '../../../../core/utils/app_constants.dart';
import '../../infra/datasources/weather_datasource.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  final Client client;

  WeatherDatasourceImpl(this.client);

  @override
  Future<CityWeather?> getCityWeather(
    String cityName, {
    String? uf,
  }) async {
    final response = await client.get(Uri.parse(AppConstants.BASE_URL));

    if (response.statusCode != 200) return null;

    return CityWeather.fromJson(
      jsonDecode(
        utf8.decode(
          response.bodyBytes,
        ),
      ),
    );
  }
}
