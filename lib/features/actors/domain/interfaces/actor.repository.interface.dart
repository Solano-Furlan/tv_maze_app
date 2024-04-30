import 'package:tv_maze_app/features/actors/domain/models/actor.model.dart';

abstract class IActorRepository {
  Future<List<Actor>> getActors({
    required int page,
  });
  Future<List<Actor>> getActorsWithSearch({
    required String search,
  });
  Future<Actor> getActor({
    required String actorId,
  });
}
