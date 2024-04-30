import 'package:tv_maze_app/features/tv_shows/domain/models/episode.model.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

abstract class ICloudTvShowsRepository {
  Future<List<TvShow>> getTvShows({
    required int page,
  });
  Future<List<TvShow>> getTvShowsWithSearch({
    required String search,
  });

  Future<List<TvShow>> getActorTvShows({
    required String actorId,
  });
  Future<TvShow> getTvShow({
    required String tvShowId,
  });
  Future<List<Episode>> getTvShowEpisodes({
    required String tvShowId,
  });
}
