import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tv_maze_app/features/authentication/domain/authentication.repository.interface.dart';

class AuthenticationRepository extends IAuthenticationRepository {
  AuthenticationRepository({
    required this.hive,
    required this.localAuthentication,
  });

  final HiveInterface hive;
  final LocalAuthentication localAuthentication;

  @override
  Future<bool> authenticateWithDevice() async {
    final isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Authenticate with your device auth methods instead.');
    return isAuthenticated;
  }

  @override
  Future<bool> authenticateWithPin({
    required String authPin,
  }) async {
    final Box<dynamic> box = await Hive.openBox('auth_method');

    final String? actualAuthPin = await box.get(
      'auth_pin',
      defaultValue: null,
    );

    await box.close();

    final bool isAuthenticated = authPin == actualAuthPin;
    return isAuthenticated;
  }
}
