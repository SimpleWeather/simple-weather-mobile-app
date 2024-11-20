import 'package:dartz/dartz.dart';

import '../models/city_feed_interaction.dart';
import '../models/new_city_feed_interaction.dart';
import '../repositories/city_feed_repository.dart';

abstract class CreateCityFeedInteraction {
  Future<Either<Exception, CityFeedInteraction?>> call(
    NewCityFeedInteraction interaction,
  );
}

class CreateCityFeedInteractionImpl implements CreateCityFeedInteraction {
  final CityFeedRepository repository;

  CreateCityFeedInteractionImpl(this.repository);

  @override
  Future<Either<Exception, CityFeedInteraction?>> call(
    NewCityFeedInteraction interaction,
  ) async {
    try {
      return Right(
        await repository.createCityFeedInteraction(
          interaction,
        ),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
