class UserCityFetch {
  List<UserCity> cities = [];

  UserCityFetch(List<UserCity> content) {
    cities = content;
  }

  factory UserCityFetch.fromMap(dynamic citiesMap) => UserCityFetch(
        (citiesMap as List)
            .map(
              UserCity.fromMap,
            )
            .toList(),
      );
}

class UserCity {
  final String id;
  final String city;
  final String? uf;
  final String userId;
  final DateTime addedAt;
  final int cityId;

  UserCity({
    required this.id,
    required this.city,
    required this.userId,
    required this.addedAt,
    required this.cityId,
    this.uf,
  });

  factory UserCity.fromMap(dynamic map) => UserCity(
        id: map['id'],
        city: map['city'],
        userId: map['userId'],
        uf: map['uf'],
        addedAt: DateTime.parse(map['addedAt']),
        cityId: map['cityId'],
      );
}
