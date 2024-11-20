import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../home/domain/models/city_weather.dart';
import '../../../domain/models/city_feed_interaction.dart';
import '../../../domain/usecases/get_city_feed_interactions.dart';
import '../../../domain/usecases/get_city_weather.dart';
import '../../../domain/usecases/save_city_to_feed.dart';

part 'city_feed_event.dart';
part 'city_feed_state.dart';

class CityFeedBloc extends Bloc<CityFeedEvent, CityFeedState> {
  CityFeedBloc() : super(CityFeedInitialState()) {
    on<FetchCityWeatherEvent>(
      _fetchCityWeather,
    );

    on<FetchCityFeedInteractionsEvent>(
      _fetchCityFeedInteractions,
    );

    on<AddCityToFeedEvent>(
      _addToFeed,
    );
  }

  Future<void> _fetchCityWeather(
    FetchCityWeatherEvent event,
    emit,
  ) async {
    emit(CityFeedLoadingState());

    emit(
      (await Modular.get<GetCityWeather>()(
        event.cityName,
        uf: event.uf,
      ))
          .fold(
        (exception) => CityFeedErrorState(exception.toString()),
        CityWeatherSuccessState.new,
      ),
    );
  }

  Future<void> _fetchCityFeedInteractions(
    FetchCityFeedInteractionsEvent event,
    emit,
  ) async {
    emit(CityFeedLoadingState());

    emit(
      (await Modular.get<GetCityFeedInteractions>()(
        event.cityId,
      ))
          .fold(
        (exception) => CityFeedErrorState(exception.toString()),
        CityFeedSuccessState.new,
      ),
    );
  }

  Future<void> _addToFeed(
    AddCityToFeedEvent event,
    emit,
  ) async {
    emit(CityFeedLoadingState());

    emit(
      (await Modular.get<SaveCityToFeed>()(
        event.city,
      ))
          .fold(
        (exception) => CityFeedErrorState(exception.toString()),
        (_) => SavedCityToFeedSuccessState(),
      ),
    );
  }
}
