import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/core/navigation/routes/actors.screen.dart';
import 'package:tv_maze_app/core/navigation/routes/authentication.routes.dart';
import 'package:tv_maze_app/core/navigation/routes/tv_shows.routes.dart';

class AppRoutesService {
  AppRoutesService._();

  static List<RouteBase> appRoutes = [
    ...AuthenticationRoutes.routes,
    ...TvShowsRoutes.routes,
    ...ActorsRoutes.routes,
  ];
}
