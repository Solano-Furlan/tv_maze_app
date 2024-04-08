import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze_app/core/environment/environment.service.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.mock_data.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/episode.interface.dart';
import 'package:tv_maze_app/features/tv_shows/domain/interfaces/tv_show.interface.dart';

void main() async {
  late Dio httpClient;
  late DioAdapter httpClientAdapter;
  late CloudTvShowsRepository cloudTvShowsRepository;

  group('CloudTvShowsRepository Unit Tests', () {
    const String baseUrl = EnvironmentService.baseUrl;

    setUp(() {
      httpClient = Dio(BaseOptions(baseUrl: baseUrl));
      httpClientAdapter = DioAdapter(
        dio: httpClient,
        matcher: const UrlRequestMatcher(),
      );
      cloudTvShowsRepository = CloudTvShowsRepository(
        httpClient: httpClient,
      );
    });

    test('getTvShows Unit Test', () async {
      const String getShowsRoute = '/shows?page=1';

      httpClientAdapter.onGet(
        getShowsRoute,
        (server) => server.reply(
          200,
          CloudTvShowsRepositoryMockData.tvShowsMapData,
        ),
      );

      final List<ITvShow> tvShows = await cloudTvShowsRepository.getTvShows(
        page: 1,
      );

      expect(tvShows.length, 3);
      expect(tvShows, CloudTvShowsRepositoryMockData.tvShows);
    });

    test('getTvShow Unit Test', () async {
      const String getShowRoute = '/shows/1';

      httpClientAdapter.onGet(
        getShowRoute,
        (server) => server.reply(
          200,
          CloudTvShowsRepositoryMockData.tvShowsMapData.first,
        ),
      );

      final ITvShow tvShow = await cloudTvShowsRepository.getTvShow(
        tvShowId: '1',
      );

      expect(tvShow, CloudTvShowsRepositoryMockData.tvShows.first);
    });

    test('getTvShowEpisodes Unit Test', () async {
      const String getEpisodesRoute = '/shows/1/episodes';

      httpClientAdapter.onGet(
        getEpisodesRoute,
        (server) => server.reply(
          200,
          CloudTvShowsRepositoryMockData.episodesMap,
        ),
      );

      final List<IEpisode> episodes =
          await cloudTvShowsRepository.getTvShowEpisodes(
        tvShowId: '1',
      );

      expect(episodes, CloudTvShowsRepositoryMockData.episodes);
    });
  });
}
