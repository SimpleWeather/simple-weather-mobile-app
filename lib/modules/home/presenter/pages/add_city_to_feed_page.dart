import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../city_feed/presenter/bloc/city_weather/city_feed_bloc.dart';
import '../../domain/models/city_weather.dart';

class AddCityToFeedPage extends StatefulWidget {
  final CityWeather city;

  const AddCityToFeedPage({
    super.key,
    required this.city,
  });

  @override
  State<AddCityToFeedPage> createState() => _AddCityToFeedPageState();
}

class _AddCityToFeedPageState extends State<AddCityToFeedPage> {
  final bloc = Modular.get<CityFeedBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (_, state) {
        if (state is CityFeedSuccessState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.city.city),
          actions: [
            IconButton(
              onPressed: () => bloc.add(
                AddCityToFeedEvent(
                  widget.city,
                ),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
