import 'package:dio/dio.dart';
import 'package:tv_maze_app/features/actors/data/normalizers/actors.repository.normalizer.dart';
import 'package:tv_maze_app/features/actors/domain/models/actor.model.dart';
import 'package:tv_maze_app/features/actors/domain/interfaces/actor.repository.interface.dart';

class ActorsRepository extends IActorRepository {
  ActorsRepository({
    required this.httpClient,
  });

  final Dio httpClient;

  @override
  Future<List<Actor>> getActors({
    required int page,
  }) async {
    final List<Actor> actors = [];

    final Response<dynamic> res = await httpClient.get(
      '/people?page=$page',
    );

    for (final Map<String, dynamic> mapData in res.data) {
      actors.add(
        ActorsRepositoryNormalizer.actorFromMap(
          mapData: mapData,
        ),
      );
    }

    return actors;
  }

  @override
  Future<List<Actor>> getActorsWithSearch({
    required String search,
  }) async {
    final List<Actor> actors = [];

    final Response<dynamic> res = await httpClient.get(
      '/search/people?q=$search',
    );

    for (final Map<String, dynamic> mapData in res.data) {
      actors.add(
        ActorsRepositoryNormalizer.actorFromMap(
          mapData: mapData['person'],
        ),
      );
    }

    return actors;
  }

  @override
  Future<Actor> getActor({
    required String actorId,
  }) async {
    final Response<dynamic> res = await httpClient.get(
      '/people/$actorId',
    );

    final Actor actor = ActorsRepositoryNormalizer.actorFromMap(
      mapData: res.data,
    );

    return actor;
  }
}
