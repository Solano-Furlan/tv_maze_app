import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tv_maze_app/features/authentication/data/authentication.repository.dart';

@module
abstract class AuthenticationModule {
  @lazySingleton
  LocalAuthentication localAuthentication() => LocalAuthentication();

  @lazySingleton
  AuthenticationRepository authenticationRepository(
    LocalAuthentication localAuthentication,
    HiveInterface hive,
  ) =>
      AuthenticationRepository(
        localAuthentication: localAuthentication,
        hive: hive,
      );
}
