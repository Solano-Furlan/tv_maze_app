import 'package:flutter/material.dart';
import 'package:tv_maze_app/core/dependencies/dependencies.dart';
import 'package:tv_maze_app/core/design_system/widgets/indicators/loading_indicator.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/main_scaffold.widget.dart';
import 'package:tv_maze_app/core/navigation/services/navigation.service.dart';
import 'package:tv_maze_app/features/settings/data/auth_method.repository.dart';
import 'package:tv_maze_app/features/settings/domain/enums/auth_method_type.enum.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInit = true;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _authenticationCheck();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const UIMainScaffold(
      canPop: false,
      body: Center(
        child: UILoadingIndicator(),
      ),
    );
  }

  Future<void> _authenticationCheck() async {
    try {
      final List<AuthMethodType> authMethodTypes =
          await getIt<AuthMethodRepository>().getAuthMethods();
      if (authMethodTypes.contains(AuthMethodType.pin)) {
        getIt<AppNavigationService>().routeToAuthentication();
      } else {
        getIt<AppNavigationService>().routeToTvShows();
      }
    } catch (e) {
      getIt<AppNavigationService>().routeToTvShows();
    }
  }
}
