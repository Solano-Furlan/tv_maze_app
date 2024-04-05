import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/cloud_tv_shows.repository.interface.dart';

class CloudTvShowsRepository extends ICloudTvShowsRepository {
  @override
  Future<List<ITvShow>> getTvShows({
    required int page,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<List<ITvShow>> getTvShowsWithSearch({
    required String search,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<ITvShow> getTvShow({
    required String tvShowId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<List<ITvShow>> getTvShowEpisodes({
    required String tvShowId,
  }) async {
    throw UnimplementedError();
  }
}
