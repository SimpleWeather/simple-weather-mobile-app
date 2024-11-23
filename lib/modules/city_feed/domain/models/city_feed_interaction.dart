import 'package:supabase_flutter/supabase_flutter.dart';

class CityFeedInteractionFetch {
  List<CityFeedInteraction> feedInteractions = [];

  CityFeedInteractionFetch(List<CityFeedInteraction> content) {
    feedInteractions = content;
  }

  factory CityFeedInteractionFetch.fromMap(dynamic map) =>
      CityFeedInteractionFetch(
        (map as List<dynamic>)
            .map(
              CityFeedInteraction.fromMap,
            )
            .toList(),
      );
}

class CityFeedInteraction {
  final String id;
  final int cityId;
  final DateTime createdAt;
  final String content;
  final String creatorId;
  final String creatorName;
  final int votesUp;
  final int votesDown;

  CityFeedInteraction({
    required this.id,
    required this.createdAt,
    required this.content,
    required this.creatorId,
    required this.creatorName,
    required this.votesUp,
    required this.votesDown,
    required this.cityId,
  });

  String get createdAtNormalized =>
      '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} às ${createdAt.hour.toString().padLeft(2, '0')}h${createdAt.minute.toString().padLeft(
            2,
            '0',
          )}';

  bool get interactionIsFromCurrentUser =>
      Supabase.instance.client.auth.currentUser?.id == creatorId;

  factory CityFeedInteraction.fromMap(dynamic map) => CityFeedInteraction(
        id: map['id'],
        createdAt: DateTime.parse(map['createdAt']),
        content: map['content'],
        creatorId: map['creatorId'],
        creatorName: map['creatorName'],
        votesUp: int.tryParse(map['votesUp'].toString()) ?? 0,
        votesDown: int.tryParse(map['votesDown'].toString()) ?? 0,
        cityId: map['cityId'],
      );
}
