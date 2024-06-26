import 'package:dio/dio.dart';
import 'package:tv_maze_app/features/tv_shows/data/normalizers/tv_shows.repository.normalizer.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/episode.model.dart';
import 'package:tv_maze_app/features/tv_shows/domain/models/tv_show.model.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/cloud_tv_shows.repository.interface.dart';

class CloudTvShowsRepository extends ICloudTvShowsRepository {
  CloudTvShowsRepository({
    required this.httpClient,
  });

  final Dio httpClient;

  @override
  Future<List<TvShow>> getTvShows({
    required int page,
  }) async {
    final List<TvShow> tvShows = [];

    final Response<dynamic> res = await httpClient.get(
      '/shows?page=$page',
    );

    for (final Map<String, dynamic> mapData in res.data) {
      tvShows.add(
        TvShowsRepositoryNormalizer.tvShowFromMap(
          mapData: mapData,
        ),
      );
    }

    return tvShows;
  }

  @override
  Future<List<TvShow>> getTvShowsWithSearch({
    required String search,
  }) async {
    final List<TvShow> tvShows = [];

    final Response<dynamic> res = await httpClient.get(
      '/search/shows?q=$search',
    );

    for (final Map<String, dynamic> mapData in res.data) {
      tvShows.add(
        TvShowsRepositoryNormalizer.tvShowFromMap(
          mapData: mapData['show'],
        ),
      );
    }

    return tvShows;
  }

  @override
  Future<List<TvShow>> getActorTvShows({
    required String actorId,
  }) async {
    final List<TvShow> tvShows = [];

    final Response<dynamic> res = await httpClient.get(
      '/people/$actorId/crewcredits?embed=show',
    );

    for (final Map<String, dynamic> mapData in res.data) {
      if (mapData['_embedded']?['show'] != null) {
        tvShows.add(
          TvShowsRepositoryNormalizer.tvShowFromMap(
            mapData: mapData['_embedded']?['show'],
          ),
        );
      }
    }

    return tvShows;
  }

  @override
  Future<TvShow> getTvShow({
    required String tvShowId,
  }) async {
    final Response<dynamic> res = await httpClient.get(
      '/shows/$tvShowId',
    );

    final TvShow tvShow = TvShowsRepositoryNormalizer.tvShowFromMap(
      mapData: res.data,
    );

    return tvShow;
  }

  @override
  Future<List<Episode>> getTvShowEpisodes({
    required String tvShowId,
  }) async {
    final List<Episode> episodes = [];

    final Response<dynamic> res = await httpClient.get(
      '/shows/$tvShowId/episodes',
    );

    for (final Map<String, dynamic> mapData in res.data) {
      episodes.add(
        TvShowsRepositoryNormalizer.episodeFromMap(
          mapData: mapData,
        ),
      );
    }

    return episodes;
  }
}
