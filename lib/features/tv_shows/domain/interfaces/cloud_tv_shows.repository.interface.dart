import 'package:tv_maze_app/features/tv_shows/domain/interfaces/episode.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';

abstract class ICloudTvShowsRepository {
  Future<List<ITvShow>> getTvShows({
    required int page,
  });
  Future<List<ITvShow>> getTvShowsWithSearch({
    required String search,
  });

  Future<List<ITvShow>> getActorTvShows({
    required String actorId,
  });
  Future<ITvShow> getTvShow({
    required String tvShowId,
  });
  Future<List<IEpisode>> getTvShowEpisodes({
    required String tvShowId,
  });
}
