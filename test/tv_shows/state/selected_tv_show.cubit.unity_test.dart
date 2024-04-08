import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze_app/core/environment/environment.service.dart';
import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.mock_data.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/local_tv_shows.repository.mock.dart';
import 'package:tv_maze_app/features/tv_shows/state/selected_tv_show/selected_tv_show.cubit.dart';
import 'package:tv_maze_app/features/tv_shows/state/selected_tv_show/selected_tv_show.state.dart';

void main() async {
  late Dio httpClient;
  late DioAdapter httpClientAdapter;
  late CloudTvShowsRepository cloudTvShowsRepository;
  late SelectedTvShowCubit selectedTvShowCubit;

  group(
    'TvShowsCubit Unit Tests',
    () {
      const String baseUrl = EnvironmentService.baseUrl;

      setUp(
        () {
          httpClient = Dio(BaseOptions(baseUrl: baseUrl));
          httpClientAdapter = DioAdapter(
            dio: httpClient,
            matcher: const UrlRequestMatcher(),
          );
          cloudTvShowsRepository = CloudTvShowsRepository(
            httpClient: httpClient,
          );
          selectedTvShowCubit = SelectedTvShowCubit(
            cloudTvShowsRepository: cloudTvShowsRepository,
            localTvShowsRepository: LocalTvShowsRepositoryMock(),
            eventBus: EventBus(),
          );
        },
      );

      blocTest<SelectedTvShowCubit, SelectedTvShowState>(
        'getTvShow Unit | Success',
        build: () => selectedTvShowCubit,
        wait: const Duration(),
        act: (SelectedTvShowCubit selectedTvShowCubit) async {
          const String getTvShowRoute = '/shows/1';
          const String getTvShowEpisodesRoute = '/shows/1/episodes';

          httpClientAdapter.onGet(
            getTvShowRoute,
            (server) => server.reply(
              200,
              CloudTvShowsRepositoryMockData.tvShowsMapData.first,
            ),
          );
          httpClientAdapter.onGet(
            getTvShowEpisodesRoute,
            (server) => server.reply(
              200,
              CloudTvShowsRepositoryMockData.episodesMap,
            ),
          );
          await selectedTvShowCubit.getTvShow(
            tvShowId: '1',
          );
        },
        expect: () => <SelectedTvShowState>[
          SelectedTvShowLoadingState(),
          SelectedTvShowLoadedState(
            tvShow: CloudTvShowsRepositoryMockData.tvShows.first.copyWith(
              episodes: CloudTvShowsRepositoryMockData.episodes,
            ),
            isFavorite: true,
          ),
        ],
      );

      blocTest<SelectedTvShowCubit, SelectedTvShowState>(
        'getTvShow Unit | Error',
        build: () => selectedTvShowCubit,
        wait: const Duration(),
        act: (SelectedTvShowCubit selectedTvShowCubit) async {
          const String getTvShowRoute = '/shows/1';
          const String getTvShowEpisodesRoute = '/shows/1/episodes';

          httpClientAdapter.onGet(
            getTvShowRoute,
            (server) => server.reply(
              500,
              null,
            ),
          );
          httpClientAdapter.onGet(
            getTvShowEpisodesRoute,
            (server) => server.reply(
              500,
              null,
            ),
          );
          await selectedTvShowCubit.getTvShow(
            tvShowId: '1',
          );
        },
        expect: () => <SelectedTvShowState>[
          SelectedTvShowLoadingState(),
          SelectedTvShowErrorState(),
        ],
      );
    },
  );
}
