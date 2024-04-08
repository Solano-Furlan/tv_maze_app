import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/features/authentication/data/authentication.repository.dart';
import 'package:tv_maze_app/features/authentication/state/authentication/authentication.state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required this.authenticationRepository,
  }) : super(AuthenticationUnauthorizedState());

  final AuthenticationRepository authenticationRepository;

  Future<AuthenticationState> authenticateWithPin({
    required String authPin,
  }) async {
    try {
      emit(AuthenticationPinLoadingState());

      final bool isAuthenticated =
          await authenticationRepository.authenticateWithPin(
        authPin: authPin,
      );

      print(isAuthenticated);

      if (!isAuthenticated) {
        throw Exception();
      }

      emit(AuthenticationAuthorizedState());
      return state;
    } catch (e) {
      emit(AuthenticationErrorState());
      return state;
    }
  }

  Future<AuthenticationState> authenticateWithDevice() async {
    try {
      emit(AuthenticationDeviceLoadingState());

      final bool isAuthenticated =
          await authenticationRepository.authenticateWithDevice();

      if (!isAuthenticated) {
        throw Exception();
      }

      emit(AuthenticationAuthorizedState());
      return state;
    } catch (e) {
      print(e);
      emit(AuthenticationErrorState());
      return state;
    }
  }
}
