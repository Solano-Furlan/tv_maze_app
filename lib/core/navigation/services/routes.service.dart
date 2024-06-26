import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/core/navigation/routes/actors.routes.dart';
import 'package:tv_maze_app/core/navigation/routes/authentication.routes.dart';
import 'package:tv_maze_app/core/navigation/routes/settings.routes.dart';
import 'package:tv_maze_app/core/navigation/routes/tv_shows.routes.dart';

class AppRoutesService {
  AppRoutesService._();

  static List<RouteBase> appRoutes = [
    ...AuthenticationRoutes.routes,
    ...TvShowsRoutes.routes,
    ...ActorsRoutes.routes,
    ...SettingsRoute.routes,
  ];
}
