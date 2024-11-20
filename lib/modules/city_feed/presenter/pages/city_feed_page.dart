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
  void initState() {
    super.initState();
  }

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
        backgroundColor: Colors.blueAccent,
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

                if (feedInteractions.isEmpty) {
                  return const Center(
                    heightFactor: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text('Não há interações ainda no feed desta cidade!'),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: feedInteractions.length,
                  shrinkWrap: true,
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
