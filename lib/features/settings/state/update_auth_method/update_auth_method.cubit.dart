import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';
import 'package:tv_maze_app/features/settings/data/auth_method.repository.dart';
import 'package:tv_maze_app/features/settings/domain/enums/auth_method_type.enum.dart';
import 'package:tv_maze_app/features/settings/domain/events/auth_method.events.dart';
import 'package:tv_maze_app/features/settings/state/update_auth_method/update_auth_method.state.dart';

class UpdateAuthMethodCubit extends Cubit<UpdateAuthMethodState> {
  UpdateAuthMethodCubit({
    required this.authMethodRepository,
    required this.eventBus,
  }) : super(UpdateAuthMethodInitialState());

  final AuthMethodRepository authMethodRepository;
  final EventBus eventBus;

  Future<UpdateAuthMethodState> updateAuthMethod({
    required AuthMethodType authMethodType,
    required String? authPin,
  }) async {
    try {
      emit(UpdateAuthMethodLoadingState());

      if (authPin != null) {
        await authMethodRepository.saveAuthPin(
          authPin: authPin,
        );
      }

      await authMethodRepository.saveAuthMethod(
        authMethodType: authMethodType,
      );

      eventBus.fire(AuthMethodUpdateEvent(
        authMethodType: authMethodType,
        authPin: authPin,
      ));

      emit(UpdateAuthMethodSuccessState());
      return state;
    } catch (e) {
      emit(UpdateAuthMethodErrorState());
      return state;
    }
  }
}
