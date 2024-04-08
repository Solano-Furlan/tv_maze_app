import 'package:hive/hive.dart';
import 'package:tv_maze_app/features/settings/domain/enums/auth_method_type.enum.dart';
import 'package:tv_maze_app/features/settings/domain/interfaces/auth_method.repository.inteface.dart';

class AuthMethodRepository extends IAuthMethodRepository {
  AuthMethodRepository({
    required this.hive,
  });

  final HiveInterface hive;

  @override
  Future<AuthMethodType> getAuthMethod() async {
    final Box<dynamic> box = await Hive.openBox('auth_method');

    final String authMethodTypeString = await box.get(
      'auth_method_type',
      defaultValue: 'none',
    );

    final AuthMethodType authMethodType = AuthMethodType.values
        .firstWhere((AuthMethodType e) => e.name == authMethodTypeString);

    await box.close();

    return authMethodType;
  }

  @override
  Future<void> saveAuthMethod({
    required AuthMethodType authMethodType,
  }) async {
    final Box<dynamic> box = await Hive.openBox('auth_method');

    await box.put(
      'auth_method_type',
      authMethodType.name,
    );

    await box.close();
  }

  @override
  Future<String?> getAuthPin() async {
    final Box<dynamic> box = await Hive.openBox('auth_method');

    final String? authPin = await box.get(
      'auth_pin',
      defaultValue: null,
    );

    await box.close();

    return authPin;
  }

  @override
  Future<void> saveAuthPin({
    required String authPin,
  }) async {
    final Box<dynamic> box = await Hive.openBox('auth_method');

    await box.put(
      'auth_pin',
      authPin,
    );

    await box.close();
  }
}
