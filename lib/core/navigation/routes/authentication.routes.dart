import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_maze_app/core/dependencies/dependencies.dart';
import 'package:tv_maze_app/features/authentication/data/authentication.repository.dart';
import 'package:tv_maze_app/features/authentication/presentation/screens/authentication.screen.dart';
import 'package:tv_maze_app/features/authentication/presentation/screens/splash.screen.dart';
import 'package:tv_maze_app/features/authentication/state/authentication/authentication.cubit.dart';

class AuthenticationRoutes {
  AuthenticationRoutes._();

  static const String splashScreenRoute = '/';
  static const String authenticationRoute = '/authentication';

  static List<RouteBase> routes = [
    GoRoute(
      path: splashScreenRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(
          child: SplashScreen(),
        );
      },
    ),
    GoRoute(
      path: authenticationRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
          child: BlocProvider<AuthenticationCubit>(
            create: (BuildContext context) => AuthenticationCubit(
              authenticationRepository: getIt<AuthenticationRepository>(),
            ),
            child: const AuthenticationScreen(),
          ),
        );
      },
    ),
  ];
}
