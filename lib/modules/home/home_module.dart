import 'package:flutter_modular/flutter_modular.dart';

import '../city_feed/city_feed_module.dart';
import 'domain/repositories/user_cities_repository.dart';
import 'domain/usecases/get_user_cities.dart';
import 'external/datasources/user_cities_datasource_impl.dart';
import 'external/drivers/weather_driver_impl.dart';
import 'infra/datasources/user_cities_datasource.dart';
import 'infra/drivers/weather_driver.dart';
import 'infra/repository/user_cities_repository_impl.dart';
import 'presenter/bloc/saved_city_weather/saved_city_weather_bloc.dart';
import 'presenter/pages/add_city_to_feed_page.dart';
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
    i.add<UserCitiesDatasource>(
      UserCitiesDatasourceImpl.new,
    );
    i.add<UserCitiesRepository>(
      UserCitiesRepositoryImpl.new,
    );
    i.add<GetUserCities>(
      GetUserCitiesImpl.new,
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
      module: CityFeedModule(),
    );
    r.child(
      '/addCityToFeedPage',
      child: (_) => AddCityToFeedPage(
        searchedCity: r.args.data,
      ),
    );
    super.routes(r);
  }
}
