import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../home/domain/models/user_city.dart';
import '../bloc/city_weather/city_feed_bloc.dart';
import '../widgets/city_feed_interaction_card_widget.dart';

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
      FetchCityFeedInteractionsEvent(
        widget.userCity.cityId,
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
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          BlocBuilder(
            bloc: bloc,
            builder: (_, state) {
              if (state is CityFeedSuccessState) {
                final feedInteractions =
                    state.cityFeedInteractions.feedInteractions;

                return ListView.builder(
                  itemCount: feedInteractions.length,
                  itemBuilder: (_, index) => CityFeedInteractionCardWidget(
                    interaction: feedInteractions[index],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
