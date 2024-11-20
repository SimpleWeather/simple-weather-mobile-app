import 'package:dartz/dartz.dart';

import '../repositories/city_feed_repository.dart';

abstract class DeleteCityFeedInteraction {
  Future<Either<Exception, void>> call(
    String interactionId,
  );
}

class DeleteCityFeedInteractionImpl implements DeleteCityFeedInteraction {
  final CityFeedRepository repository;

  DeleteCityFeedInteractionImpl(this.repository);

  @override
  Future<Either<Exception, void>> call(
    String interactionId,
  ) async {
    try {
      return Right(
        await repository.deleteCityFeedInteraction(
          interactionId,
        ),
      );
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
