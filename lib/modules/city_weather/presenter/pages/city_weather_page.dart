import 'package:flutter/material.dart';

import '../../../home/domain/models/user_city.dart';

class CityWeatherPage extends StatefulWidget {
  final UserCity userCity;

  const CityWeatherPage({
    super.key,
    required this.userCity,
  });

  @override
  State<CityWeatherPage> createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
