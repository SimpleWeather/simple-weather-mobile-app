import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../home/domain/models/city_weather.dart';
import '../../../domain/usecases/get_city_weather.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  CityWeatherBloc() : super(CityWeatherInitialState()) {
    on<FetchCityWeatherEvent>(_fetchCityWeather);
  }

  Future<void> _fetchCityWeather(
    FetchCityWeatherEvent event,
    emit,
  ) async {
    emit(CityWeatherLoadingState());

    emit(
      (await Modular.get<GetCityWeather>()(
        event.cityName,
        uf: event.uf,
      ))
          .fold(
        (exception) => CityWeatherErrorState(exception.toString()),
        CityWeatherSuccessState.new,
      ),
    );
  }
}
