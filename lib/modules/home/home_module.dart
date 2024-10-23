import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../city_weather/city_weather_module.dart';
import '../city_weather/domain/repositories/weather_repository.dart';
import '../city_weather/domain/usecases/get_city_weather.dart';
import '../city_weather/external/datasources/weather_datasource_impl.dart';
import '../city_weather/infra/datasources/weather_datasource.dart';
import '../city_weather/infra/repositories/weather_repository_impl.dart';
import '../city_weather/presenter/bloc/city_weather/city_weather_bloc.dart';
import 'domain/usecases/get_user_cities.dart';
import 'external/drivers/weather_driver_impl.dart';
import 'infra/drivers/weather_driver.dart';
import 'presenter/bloc/saved_city_weather/saved_city_weather_bloc.dart';
import 'presenter/pages/home_page.dart';
import 'presenter/view_models/home_view_model.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add<HomeViewModel>(
      HomeViewModelImpl.new,
    );
    i.add<SavedCityWeatherBloc>(
      SavedCityWeatherBloc.new,
    );

    i.add<WeatherDriver>(
      WeatherDriverImpl.new,
    );
    i.add<GetUserCities>(
      GetUserCitiesImpl.new,
    );

    // CityWeatherModule
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
      child: (_) => const HomePage(),
    );
    r.module(
      '/cityWeatherModule',
      module: CityWeatherModule(),
    );
    super.routes(r);
  }
}
