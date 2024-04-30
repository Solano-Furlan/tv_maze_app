import 'package:tv_maze_app/core/environment/environment.service.dart';
import 'package:tv_maze_app/features/actors/domain/models/actor.model.dart';

class ActorsRepositoryNormalizer {
  ActorsRepositoryNormalizer._();

  static Actor actorFromMap({
    required Map<String, dynamic> mapData,
  }) =>
      Actor(
        id: (mapData['id'] as int).toString(),
        name: mapData['name'] as String,
        imageUrl: mapData['image']?['medium'] as String? ??
            mapData['image']?['original'] as String? ??
            EnvironmentService.placeHolderImageUrl,
        country: mapData['country']?['name'] as String?,
        birthday: mapData['birthday'] != null
            ? DateTime.parse(mapData['birthday'])
            : null,
      );
}
