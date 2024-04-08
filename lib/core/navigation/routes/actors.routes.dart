import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/core/dependencies/dependencies.dart';
import 'package:tv_maze_app/core/navigation/services/page_builder.service.dart';
import 'package:tv_maze_app/features/actors/data/data/actors.repository.dart';
import 'package:tv_maze_app/features/actors/presentation/screens/actors.screen.dart';
import 'package:tv_maze_app/features/actors/presentation/screens/selected_actor.screen.dart';
import 'package:tv_maze_app/features/actors/state/actors/actors.cubit.dart';
import 'package:tv_maze_app/features/actors/state/selected_actor/selected_actor.cubit.dart';
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.dart';

class ActorsRoutes {
  ActorsRoutes._();

  static const String actorsRoute = '/actors';
  static String selectedActorRoute({
    required String? actorId,
  }) =>
      '/actors/${actorId ?? ':actorId'}';

  static List<RouteBase> routes = [
    GoRoute(
      path: actorsRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
          child: BlocProvider<ActorsCubit>(
            create: (BuildContext context) => ActorsCubit(
              actorsRepository: getIt<ActorsRepository>(),
            )..getActors(
                search: null,
              ),
            child: const ActorsScreen(),
          ),
        );
      },
    ),
    GoRoute(
      path: selectedActorRoute(actorId: null),
      pageBuilder: (BuildContext context, GoRouterState state) {
        final String actorId = state.pathParameters['actorId']!;

        return PageBuilderService.pageBuilder(
          child: BlocProvider<SelectedActorCubit>(
            create: (BuildContext context) => SelectedActorCubit(
              actorsRepository: getIt<ActorsRepository>(),
              cloudTvShowsRepository: getIt<CloudTvShowsRepository>(),
            )..getActor(
                actorId: actorId,
              ),
            child: SelectedActorScreen(
              actorId: actorId,
            ),
          ),
        );
      },
    ),
  ];
}
