import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../home/domain/models/user_city.dart';
import '../bloc/city_weather/city_feed_bloc.dart';
import '../widgets/city_feed_interaction_card_widget.dart';
import 'create_city_interaction_bottom_sheet.dart';

class CityFeedPage extends StatefulWidget {
  final UserCity userCity;

  const CityFeedPage({
    super.key,
    required this.userCity,
  });

  @override
  State<CityFeedPage> createState() => _CityFeedPageState();
}

class _CityFeedPageState extends State<CityFeedPage> {
  late final bloc = Modular.get<CityFeedBloc>()
    ..add(
      FetchCityFeedInfoEvent(
        cityId: widget.userCity.cityId,
        cityName: widget.userCity.city,
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userCity.city,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          builder: (_) => CreateCityInteractionBottomSheet(
            cityId: widget.userCity.cityId,
            onConfirmTap: (content) => bloc.add(
              AddCityFeedInteraction(
                cityId: widget.userCity.cityId,
                content: content,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (_, state) {
          if (state is CityFeedInfoSuccessState) {
            final feedInteractions =
                state.cityFeedInteractions.feedInteractions;
            final cityWeather = state.cityWeather;

            return Column(
              children: [
                if (cityWeather != null) ...{
                  Text(
                    '${cityWeather.maxTemperature.toStringAsPrecision(2)} °C',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${cityWeather.minTemperature.toStringAsPrecision(2)} °C',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                },
                if (feedInteractions.isEmpty)
                  const Center(
                    heightFactor: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text('Não há interações ainda no feed desta cidade!'),
                      ],
                    ),
                  )
                else ...{
                  const SizedBox(height: 20),
                  ListView.builder(
                    itemCount: feedInteractions.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final interaction = feedInteractions[index];

                      return CityFeedInteractionCardWidget(
                        interaction: interaction,
                        onTrailingTap: () async => showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (_) => Container(),
                        ),
                      );
                    },
                  ),
                },
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
