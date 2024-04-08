import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/features/settings/presentation/settings.screen.dart';

class SettingsRoute {
  SettingsRoute._();

  static const String settingsRoute = '/settings';
  static List<RouteBase> routes = [
    GoRoute(
      path: settingsRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(
          child: SettingsScreen(),
        );
      },
    ),
  ];
}
