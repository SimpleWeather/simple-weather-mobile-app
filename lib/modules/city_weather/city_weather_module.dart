import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_city_weather.dart';
import 'external/datasources/weather_datasource_impl.dart';
import 'infra/datasources/weather_datasource.dart';
import 'infra/repositories/weather_repository_impl.dart';
import 'presenter/bloc/city_weather/city_weather_bloc.dart';
import 'presenter/pages/city_weather_page.dart';

class CityWeatherModule extends Module {
  @override
  void binds(Injector i) {
    i.add<Client>(
      Client.new,
    );
    i.add<WeatherDatasource>(
      WeatherDatasourceImpl.new,
    );
    i.add<WeatherRepository>(
      WeatherRepositoryImpl.new,
    );
    i.add<GetCityWeather>(
      GetCityWeatherImpl.new,
    );
    i.add<CityWeatherBloc>(
      CityWeatherBloc.new,
    );

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => CityWeatherPage(
        userCity: r.args.data,
      ),
    );

    super.routes(r);
  }
}
