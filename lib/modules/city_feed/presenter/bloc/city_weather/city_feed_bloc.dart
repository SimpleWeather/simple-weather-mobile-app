import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../home/domain/models/city_weather.dart';
import '../../../domain/models/city_feed_interaction.dart';
import '../../../domain/models/new_city_feed_interaction.dart';
import '../../../domain/usecases/create_city_feed_interaction.dart';
import '../../../domain/usecases/delete_city_feed_interaction.dart' as delete;
import '../../../domain/usecases/get_city_feed_interactions.dart';
import '../../../domain/usecases/get_city_weather.dart';
import '../../../domain/usecases/save_city_to_feed.dart';

part 'city_feed_event.dart';
part 'city_feed_state.dart';

class CityFeedBloc extends Bloc<CityFeedEvent, CityFeedState> {
  CityFeedInteractionFetch? _interactions;
  CityWeather? _cityWeather;

  CityFeedBloc() : super(CityFeedInitialState()) {
    on<FetchCityWeatherEvent>(
      _fetchCityWeather,
    );

    on<AddCityToFeedEvent>(
      _addToFeed,
    );

    on<FetchCityFeedInfoEvent>(
      _fetchCityFeedInfo,
    );

    on<AddCityFeedInteraction>(
      _addCityFeedInteraction,
    );

    on<DeleteCityFeedInteraction>(
      _deleteCityFeedInteraction,
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

  Future<void> _fetchCityFeedInfo(
    FetchCityFeedInfoEvent event,
    emit,
  ) async {
    emit(CityFeedLoadingState());

    final cityWeather = (await Modular.get<GetCityWeather>()(
      event.cityName,
      uf: event.uf,
    ))
        .fold(
      (_) => null,
      (weather) => weather,
    );

    _cityWeather = cityWeather;

    emit(
      (await Modular.get<GetCityFeedInteractions>()(
        cityWeather?.id ?? event.cityId,
      ))
          .fold(
        (exception) => CityFeedErrorState(
          exception.toString(),
        ),
        (interactions) {
          _interactions = interactions;

          return CityFeedInfoSuccessState(
            cityFeedInteractions: interactions,
            cityWeather: cityWeather,
          );
        },
      ),
    );
  }

  Future<void> _addCityFeedInteraction(
    AddCityFeedInteraction event,
    emit,
  ) async {
    if (_interactions == null) return;

    emit(CityFeedLoadingState());

    emit(
      (await Modular.get<CreateCityFeedInteraction>().call(
        NewCityFeedInteraction(
          cityId: event.cityId,
          content: event.content,
        ),
      ))
          .fold(
        (exception) => CityFeedErrorState(
          exception.toString(),
        ),
        (createdInteraction) {
          _interactions = CityFeedInteractionFetch(
            [
              if (createdInteraction != null) createdInteraction,
              ..._interactions!.feedInteractions,
            ],
          );

          return CityFeedInfoSuccessState(
            cityFeedInteractions: _interactions!,
            cityWeather: _cityWeather,
          );
        },
      ),
    );
  }

  Future<void> _deleteCityFeedInteraction(
    DeleteCityFeedInteraction event,
    emit,
  ) async {
    if (_interactions == null) return;

    emit(CityFeedLoadingState());

    emit(
      (await Modular.get<delete.DeleteCityFeedInteraction>().call(
        event.interactionId,
      ))
          .fold(
        (exception) => CityFeedErrorState(
          exception.toString(),
        ),
        (_) {
          _interactions = CityFeedInteractionFetch(
            _interactions!.feedInteractions
              ..removeWhere(
                (interaction) => interaction.id == event.interactionId,
              ),
          );

          return CityFeedInfoSuccessState(
            cityFeedInteractions: _interactions!,
            cityWeather: _cityWeather,
          );
        },
      ),
    );
  }
}
