import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze_app/core/environment/environment.service.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.mock_data.dart';
import 'package:tv_maze_app/features/tv_shows/state/tv_shows/tv_shows.cubit.dart';
import 'package:tv_maze_app/features/tv_shows/state/tv_shows/tv_shows.state.dart';

void main() async {
  late Dio httpClient;
  late DioAdapter httpClientAdapter;
  late CloudTvShowsRepository cloudTvShowsRepository;
  late TvShowsCubit tvShowsCubit;

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
          tvShowsCubit = TvShowsCubit(
            cloudTvShowsRepository: cloudTvShowsRepository,
          );
        },
      );

      blocTest<TvShowsCubit, TvShowsState>(
        'getTvShows Unit | Success',
        build: () => tvShowsCubit,
        wait: const Duration(),
        act: (TvShowsCubit tvShowsCubit) async {
          const String getTvShowsRoute = '/shows?page=1';

          httpClientAdapter.onGet(
            getTvShowsRoute,
            (server) => server.reply(
              200,
              CloudTvShowsRepositoryMockData.tvShowsMapData,
            ),
          );
          await tvShowsCubit.getTvShows(
            search: null,
          );
        },
        expect: () => <TvShowsState>[
          TvShowsLoadingState(),
          TvShowsLoadedState(
            tvShows: CloudTvShowsRepositoryMockData.tvShows,
            currentPage: 1,
            hasNextPage: true,
          ),
        ],
      );

      blocTest<TvShowsCubit, TvShowsState>(
        'getTvShows Unit | Error',
        build: () => tvShowsCubit,
        wait: const Duration(),
        act: (TvShowsCubit tvShowsCubit) async {
          const String getTvShowsRoute = '/shows?page=1';

          httpClientAdapter.onGet(
            getTvShowsRoute,
            (server) => server.reply(
              500,
              null,
            ),
          );
          await tvShowsCubit.getTvShows(
            search: null,
          );
        },
        expect: () => <TvShowsState>[
          TvShowsLoadingState(),
          TvShowsErrorState(),
        ],
      );
    },
  );
}
