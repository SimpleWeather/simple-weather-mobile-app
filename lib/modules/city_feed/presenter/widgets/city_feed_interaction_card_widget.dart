import 'package:flutter/material.dart';

import '../../domain/models/city_feed_interaction.dart';

class CityFeedInteractionCardWidget extends StatelessWidget {
  final CityFeedInteraction interaction;

  const CityFeedInteractionCardWidget({
    super.key,
    required this.interaction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        child: Text(
          interaction.creatorName.split('').first.toUpperCase(),
        ),
      ),
      title: Text(
        interaction.creatorName,
      ),
      subtitle: Text(
        interaction.content,
      ),
    );
  }
}
