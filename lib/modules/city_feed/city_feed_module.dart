import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import 'domain/repositories/city_feed_repository.dart';
import 'domain/usecases/get_city_feed_interactions.dart';
import 'domain/usecases/get_city_weather.dart';
import 'external/datasources/city_feed_datasource_impl.dart';
import 'infra/datasources/city_feed_datasource.dart';
import 'infra/repositories/city_feed_repository_impl.dart';
import 'presenter/bloc/city_weather/city_feed_bloc.dart';
import 'presenter/pages/city_feed_page.dart';

class CityFeedModule extends Module {
  @override
  void binds(Injector i) {
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
    i.add<CityFeedBloc>(
      CityFeedBloc.new,
    );

    i.add<GetCityFeedInteractions>(
      GetCityFeedInteractionsImpl.new,
    );

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => CityFeedPage(
        userCity: r.args.data,
      ),
    );

    super.routes(r);
  }
}
