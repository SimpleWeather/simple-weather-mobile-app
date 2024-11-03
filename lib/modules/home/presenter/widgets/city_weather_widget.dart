import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/models/user_city.dart';

class CityWeatherWidget extends StatefulWidget {
  final UserCity userCity;

  const CityWeatherWidget({
    super.key,
    required this.userCity,
  });

  @override
  State<CityWeatherWidget> createState() => _CityWeatherWidgetState();
}

class _CityWeatherWidgetState extends State<CityWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Modular.to.pushNamed(
        './cityWeatherModule',
        arguments: widget.userCity,
      ),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          color: Colors.blueAccent,
        ),
      ),
      title: Text(
        widget.userCity.city,
      ),
    );
  }
}
