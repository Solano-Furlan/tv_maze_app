import 'package:tv_maze_app/features/tv_shows/domain/interfaces/local_tv_shows.repository.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

class LocalTvShowsRepositoryMock extends ILocalTvShowsRepository {
  @override
  Future<List<TvShow>> getFavoriteTvShows() async {
    return [];
  }

  @override
  Future<void> addFavoriteTvShow({required TvShow tvShow}) async {}

  @override
  Future<void> remodeFavoriteTvShow({required String tvShowId}) async {}

  @override
  Future<bool> isFavorite({required String tvShowId}) async {
    return true;
  }
}
