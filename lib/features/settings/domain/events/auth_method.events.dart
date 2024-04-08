import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';
import 'package:tv_maze_app/features/settings/domain/enums/auth_method_type.enum.dart';

class AuthMethodUpdateEvent extends EventBusMessage {
  AuthMethodUpdateEvent({
    required this.authMethodType,
    required this.authPin,
  });

  final AuthMethodType authMethodType;
  final String? authPin;
}
