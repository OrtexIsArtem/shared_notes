part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthSignOutEvent extends AuthEvent {}

class AuthUserChangedEvent extends AuthEvent {
  AuthUserChangedEvent(this.user);

  final User user;
}

class AuthSignInWithGoogleEvent extends AuthEvent {}
