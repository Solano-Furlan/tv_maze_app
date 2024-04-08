import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/core/navigation/routes/actors.routes.dart';
import 'package:tv_maze_app/core/navigation/routes/authentication.routes.dart';
import 'package:tv_maze_app/core/navigation/routes/settings.routes.dart';
import 'package:tv_maze_app/core/navigation/routes/tv_shows.routes.dart';

class AppNavigationService {
  AppNavigationService({
    required this.appRouter,
  });

  final GoRouter appRouter;

  void _routeTo(
    String location,
  ) {
    if (kIsWeb) {
      appRouter.go(location);
    } else {
      appRouter.push(location);
    }
  }

  bool canPop() => appRouter.canPop();

  bool pop() {
    if (canPop()) {
      appRouter.pop(true);
      return true;
    }
    return false;
  }

  void routeToDynamicLocaton({
    required String location,
  }) =>
      appRouter.go(location);

  void routeToAuthentication() => _routeTo(
        AuthenticationRoutes.authenticationRoute,
      );

  void routeToTvShows() => _routeTo(
        TvShowsRoutes.tvShowsRoute,
      );

  void routeToSelectedTvShow({
    required String tvShowId,
  }) =>
      _routeTo(
        TvShowsRoutes.selectedTvShowRoute(
          tvShowId: tvShowId,
        ),
      );

  void routeToFavoriteTvShows() => _routeTo(
        TvShowsRoutes.favoriteTvShowsRoute,
      );

  void routeToActors() => _routeTo(
        ActorsRoutes.actorsRoute,
      );

  void routeToSelectedActor({
    required String actorId,
  }) =>
      _routeTo(
        ActorsRoutes.selectedActorRoute(actorId: actorId),
      );

  void routeToSettings() => _routeTo(
        SettingsRoute.settingsRoute,
      );
}
