import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:tv_maze_app/core/environment/environment.service.dart';

@module
abstract class HttpClientModule {
  @lazySingleton
  Dio appRouter() {
    final Dio dio = Dio();
    dio.options.baseUrl = EnvironmentService.baseUrl;

    return dio;
  }
}
