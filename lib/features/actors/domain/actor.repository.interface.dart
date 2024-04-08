import 'package:tv_maze_app/features/actors/domain/actor.interface.dart';

abstract class IActorRepository {
  Future<List<IActor>> getActors({
    required int page,
  });
  Future<List<IActor>> getActorsWithSearch({
    required String search,
  });
  Future<IActor> getActor({
    required String actorId,
  });
}
