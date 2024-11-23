class NewCityFeedInteraction {
  final int cityId;
  final String content;

  NewCityFeedInteraction({
    required this.cityId,
    required this.content,
  });

  Map<String, dynamic> toMap({
    required String creatorId,
    required String creatorName,
  }) =>
      {
        'creatorId': creatorId,
        'creatorName': creatorName,
        'cityId': cityId,
        'content': content,
      };
}
