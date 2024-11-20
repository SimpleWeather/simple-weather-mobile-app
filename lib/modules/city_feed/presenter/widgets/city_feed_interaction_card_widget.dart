import 'package:flutter/material.dart';

import '../../domain/models/city_feed_interaction.dart';

class CityFeedInteractionCardWidget extends StatelessWidget {
  final CityFeedInteraction interaction;
  final VoidCallback onTrailingTap;

  const CityFeedInteractionCardWidget({
    super.key,
    required this.interaction,
    required this.onTrailingTap,
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
      isThreeLine: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            interaction.creatorName,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            interaction.createdAtNormalized,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
        ],
      ),
      subtitle: Text(
        interaction.content,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: IconButton(
        onPressed: onTrailingTap,
        icon: const Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
