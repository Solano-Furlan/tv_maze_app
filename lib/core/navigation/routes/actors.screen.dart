import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/core/dependencies/dependencies.dart';
import 'package:tv_maze_app/features/actors/data/data/actors.repository.dart';
import 'package:tv_maze_app/features/actors/presentation/screens/actors.screen.dart';
import 'package:tv_maze_app/features/actors/state/actors/actors.cubit.dart';

class ActorsRoutes {
  ActorsRoutes._();

  static const String actorsRoute = '/actors';
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
  ];
}
