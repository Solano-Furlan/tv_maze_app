import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUnauthorizedState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationPinLoadingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationDeviceLoadingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationAuthorizedState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationErrorState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
