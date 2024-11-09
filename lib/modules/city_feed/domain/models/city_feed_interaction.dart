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
  final DateTime createdAt;
  final String content;
  final String creatorId;
  final String creatorName;
  final int votesUp;
  final int votesDown;
  final String cityId;

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

  factory CityFeedInteraction.fromMap(dynamic map) => CityFeedInteraction(
        id: map['id'],
        createdAt: DateTime.parse(map['createdAt']),
        content: map['content'],
        creatorId: map['creatorId'],
        creatorName: map['creatorName'],
        votesUp: int.tryParse(map['votesUp']) ?? 0,
        votesDown: int.tryParse(map['votesDown']) ?? 0,
        cityId: map['cityId'],
      );
}
