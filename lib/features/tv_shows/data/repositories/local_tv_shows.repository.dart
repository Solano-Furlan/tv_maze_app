import 'package:hive/hive.dart';
import 'package:tv_maze_app/features/tv_shows/data/normalizers/tv_shows.repository.normalizer.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/local_tv_shows.repository.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';

class LocalTvShowsRepository extends ILocalTvShowsRepository {
  LocalTvShowsRepository({
    required this.hive,
  });

  final HiveInterface hive;

  @override
  Future<List<TvShow>> getFavoriteTvShows() async {
    final List<TvShow> favoriteTvShows = [];

    final Box box = await Hive.openBox('favorite_tv_shows');
    final List<Map<String, dynamic>> data =
        box.values.toList().map((e) => Map<String, dynamic>.from(e)).toList();

    for (final Map<String, dynamic> mapData in data) {
      favoriteTvShows.add(
        TvShowsRepositoryNormalizer.tvShowFromMap(
          mapData: mapData,
        ),
      );
    }

    await box.close();

    return favoriteTvShows;
  }

  @override
  Future<void> addFavoriteTvShow({
    required TvShow tvShow,
  }) async {
    final Box<dynamic> box = await Hive.openBox('favorite_tv_shows');

    final Map<String, dynamic> tvShowToMapData =
        TvShowsRepositoryNormalizer.tvShowToMapData(tvShow: tvShow);

    await box.put(
      tvShow.id,
      tvShowToMapData,
    );
    await box.close();
  }

  @override
  Future<void> remodeFavoriteTvShow({
    required String tvShowId,
  }) async {
    final Box<dynamic> box = await Hive.openBox('favorite_tv_shows');

    await box.delete(
      tvShowId,
    );
    await box.close();
  }

  @override
  Future<bool> isFavorite({
    required String tvShowId,
  }) async {
    final Box<dynamic> box = await Hive.openBox('favorite_tv_shows');

    final dynamic tvShow = await box.get(
      tvShowId,
    );

    await box.close();

    return tvShow != null;
  }
}
