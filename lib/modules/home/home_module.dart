import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../city_feed/city_feed_module.dart';
import '../city_feed/domain/repositories/city_feed_repository.dart';
import '../city_feed/domain/usecases/get_city_weather.dart';
import '../city_feed/domain/usecases/save_city_to_feed.dart';
import '../city_feed/external/datasources/city_feed_datasource_impl.dart';
import '../city_feed/infra/datasources/city_feed_datasource.dart';
import '../city_feed/infra/repositories/city_feed_repository_impl.dart';
import '../city_feed/presenter/bloc/city_weather/city_feed_bloc.dart';
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
    i.add<Client>(
      Client.new,
    );
    i.add<CityFeedDatasource>(
      CityFeedDatasourceImpl.new,
    );
    i.add<CityFeedRepository>(
      CityFeedRepositoryImpl.new,
    );
    i.add<GetCityWeather>(
      GetCityWeatherImpl.new,
    );
    i.addLazySingleton<SaveCityToFeed>(
      SaveCityToFeedImpl.new,
    );
    i.add<CityFeedBloc>(
      CityFeedBloc.new,
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
