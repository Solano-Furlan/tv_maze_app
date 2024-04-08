import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze_app/core/environment/environment.service.dart';
import 'package:tv_maze_app/features/actors/data/data/actors.repository.dart';
import 'package:tv_maze_app/features/actors/data/normalizers/actors.repository.normalizer.mock_data.dart';
import 'package:tv_maze_app/features/actors/domain/actor.interface.dart';

void main() async {
  late Dio httpClient;
  late DioAdapter httpClientAdapter;
  late ActorsRepository actorsRepository;

  group('ActorsRepository Unit Tests', () {
    const String baseUrl = EnvironmentService.baseUrl;

    setUp(() {
      httpClient = Dio(BaseOptions(baseUrl: baseUrl));
      httpClientAdapter = DioAdapter(
        dio: httpClient,
        matcher: const UrlRequestMatcher(),
      );
      actorsRepository = ActorsRepository(
        httpClient: httpClient,
      );
    });

    test('getActors Unit Test', () async {
      const String getActorsRoute = '/people?page=1';

      httpClientAdapter.onGet(
        getActorsRoute,
        (server) => server.reply(
          200,
          ActorsRepositoryMockData.actorsMapData,
        ),
      );

      final List<IActor> actors = await actorsRepository.getActors(
        page: 1,
      );

      expect(actors.length, 3);
      expect(actors, ActorsRepositoryMockData.actors);
    });
  });
}
