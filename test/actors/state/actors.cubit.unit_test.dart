import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze_app/core/environment/environment.service.dart';
import 'package:tv_maze_app/features/actors/data/data/actors.repository.dart';
import 'package:tv_maze_app/features/actors/data/normalizers/actors.repository.normalizer.mock_data.dart';
import 'package:tv_maze_app/features/actors/state/actors/actors.cubit.dart';
import 'package:tv_maze_app/features/actors/state/actors/actors.state.dart';

void main() async {
  late Dio httpClient;
  late DioAdapter httpClientAdapter;
  late ActorsRepository actorsRepository;
  late ActorsCubit actorsCubit;

  group(
    'ActorsCubit Unit Tests',
    () {
      const String baseUrl = EnvironmentService.baseUrl;

      setUp(
        () {
          httpClient = Dio(BaseOptions(baseUrl: baseUrl));
          httpClientAdapter = DioAdapter(
            dio: httpClient,
            matcher: const UrlRequestMatcher(),
          );
          actorsRepository = ActorsRepository(
            httpClient: httpClient,
          );
          actorsCubit = ActorsCubit(
            actorsRepository: actorsRepository,
          );
        },
      );

      blocTest<ActorsCubit, ActorsState>(
        'getActors Unit | Success',
        build: () => actorsCubit,
        wait: const Duration(),
        act: (ActorsCubit actorsCubit) async {
          const String getActorsRoute = '/people?page=1';

          httpClientAdapter.onPost(
            getActorsRoute,
            (server) => server.reply(
              200,
              ActorsRepositoryMockData.actorsMapData,
            ),
          );
          await actorsCubit.getActors(
            search: null,
          );
        },
        expect: () => <ActorsState>[
          ActorsLoadingState(),
          ActorsLoadedState(
            actors: ActorsRepositoryMockData.actors,
            currentPage: 1,
            hasNextPage: true,
          ),
        ],
      );

      blocTest<ActorsCubit, ActorsState>(
        'getActors Unit | Error',
        build: () => actorsCubit,
        wait: const Duration(),
        act: (ActorsCubit actorsCubit) async {
          const String getActorsRoute = '/people?page=1';

          httpClientAdapter.onPost(
            getActorsRoute,
            (server) => server.reply(
              500,
              null,
            ),
          );
          await actorsCubit.getActors(
            search: null,
          );
        },
        expect: () => <ActorsState>[
          ActorsLoadingState(),
          ActorsErrorState(),
        ],
      );
    },
  );
}
