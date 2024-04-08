import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/core/dependencies/dependencies.dart';
import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';
import 'package:tv_maze_app/features/settings/data/auth_method.repository.dart';
import 'package:tv_maze_app/features/settings/presentation/screens/settings.screen.dart';
import 'package:tv_maze_app/features/settings/state/auth_method/auth_method.cubit.dart';
import 'package:tv_maze_app/features/settings/state/update_auth_method/update_auth_method.cubit.dart';

class SettingsRoute {
  SettingsRoute._();

  static const String settingsRoute = '/settings';
  static List<RouteBase> routes = [
    GoRoute(
      path: settingsRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthMethodCubit>(
                create: (BuildContext context) => AuthMethodCubit(
                  authMethodRepository: getIt<AuthMethodRepository>(),
                  eventBus: getIt<EventBus>(),
                )
                  ..initialize()
                  ..getAuthMethod(),
              ),
              BlocProvider<UpdateAuthMethodCubit>(
                create: (BuildContext context) => UpdateAuthMethodCubit(
                  authMethodRepository: getIt<AuthMethodRepository>(),
                  eventBus: getIt<EventBus>(),
                ),
              ),
            ],
            child: const SettingsScreen(),
          ),
        );
      },
    ),
  ];
}
