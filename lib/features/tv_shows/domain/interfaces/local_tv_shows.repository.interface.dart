import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

abstract class ILocalTvShowsRepository {
  Future<List<TvShow>> getFavoriteTvShows();
  Future<void> addFavoriteTvShow({
    required TvShow tvShow,
  });
  Future<void> remodeFavoriteTvShow({
    required String tvShowId,
  });
  Future<bool> isFavorite({
    required String tvShowId,
  });
}
