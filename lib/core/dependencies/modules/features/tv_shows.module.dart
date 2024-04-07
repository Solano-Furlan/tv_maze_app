import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.dart';

@module
abstract class TvShowsModule {
  @lazySingleton
  CloudTvShowsRepository cloudTvShowsRepository(
    Dio httpClient,
  ) =>
      CloudTvShowsRepository(
        httpClient: httpClient,
      );
}
