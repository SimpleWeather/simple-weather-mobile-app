import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_saved_cities.dart';
import 'domain/usecases/save_city.dart';
import 'external/drivers/weather_driver_impl.dart';
import 'infra/drivers/weather_driver.dart';
import 'presenter/bloc/city_weather/city_weather_bloc.dart';
import 'presenter/pages/home_page.dart';
import 'presenter/view_models/home_view_model.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add<HomeViewModel>(
      HomeViewModelImpl.new,
    );
    i.add<CityWeatherBloc>(
      CityWeatherBloc.new,
    );

    i.add<WeatherDriver>(
      WeatherDriverImpl.new,
    );
    i.add<GetSavedCities>(
      GetSavedCitiesImpl.new,
    );
    i.add<SaveCity>(
      SaveCityImpl.new,
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const HomePage(),
    );
    super.routes(r);
  }
}
