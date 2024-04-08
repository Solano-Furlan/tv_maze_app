import 'package:tv_maze_app/features/settings/domain/enums/auth_method_type.enum.dart';

abstract class IAuthMethodRepository {
  Future<AuthMethodType> getAuthMethod();
  Future<void> saveAuthMethod({
    required AuthMethodType authMethodType,
  });
  Future<String?> getAuthPin();
  Future<void> saveAuthPin({
    required String authPin,
  });
}
