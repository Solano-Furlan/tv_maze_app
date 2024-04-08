import 'package:equatable/equatable.dart';
import 'package:tv_maze_app/features/settings/domain/enums/auth_method_type.enum.dart';

abstract class AuthMethodState extends Equatable {}

class AuthMethodLoadingState extends AuthMethodState {
  @override
  List<Object?> get props => [];
}

class AuthMethodLoadedState extends AuthMethodState {
  AuthMethodLoadedState({
    required this.authMethodTypes,
    required this.authPin,
  });

  final List<AuthMethodType> authMethodTypes;
  final String? authPin;

  @override
  List<Object?> get props => [
        authMethodTypes,
        authPin,
      ];
}

class AuthMethodErrorState extends AuthMethodState {
  @override
  List<Object?> get props => [];
}
