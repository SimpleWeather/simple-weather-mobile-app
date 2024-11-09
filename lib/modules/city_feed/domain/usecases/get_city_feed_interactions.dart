import 'package:dartz/dartz.dart';

import '../models/city_feed_interaction.dart';
import '../repositories/city_feed_repository.dart';

abstract class GetCityFeedInteractions {
  Future<Either<Exception, CityFeedInteractionFetch>> call(int cityId);
}

class GetCityFeedInteractionsImpl implements GetCityFeedInteractions {
  final CityFeedRepository repository;

  GetCityFeedInteractionsImpl(this.repository);

  @override
  Future<Either<Exception, CityFeedInteractionFetch>> call(int cityId) async {
    try {
      return Right(
        await repository.getCityFeedInteractions(
          cityId,
        ),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
