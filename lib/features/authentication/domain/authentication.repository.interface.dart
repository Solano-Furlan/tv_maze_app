abstract class IAuthenticationRepository {
  Future<void> authenticateWithDevice();
  Future<bool> authenticateWithPin({
    required String authPin,
  });
}
