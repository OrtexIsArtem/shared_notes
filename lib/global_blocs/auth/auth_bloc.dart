import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          AuthState(
            user: authRepository.currentUser.isNotEmpty
                ? authRepository.currentUser
                : User.empty,
            userStatus: authRepository.currentUser.isNotEmpty
                ? UserAuthStatuses.authenticated
                : UserAuthStatuses.unauthenticated,
          ),
        ) {
    on<AuthSignOutEvent>(_onSignOut);
    on<AuthUserChangedEvent>(_onUserChanged);
    on<AuthSignInWithGoogleEvent>(_onSignInWithGoogle);
    _userStream = _authRepository.user.listen(
          (user) {
            add(AuthUserChangedEvent(user));
          },
    );
  }

  final AuthRepository _authRepository;
  late final StreamSubscription<User> _userStream;


  @override
  Future<void> close() {
    _userStream.cancel();
    return super.close();
  }

  void _onUserChanged(
    AuthUserChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    if (event.user.isNotEmpty) {
      emit(state.copyWith(
        user: event.user,
        userStatus: UserAuthStatuses.authenticated,
      ));
      return;
    }
    emit(state.copyWith(
      user: User.empty,
      userStatus: UserAuthStatuses.unauthenticated,
    ));
  }

  void _onSignOut(
    AuthSignOutEvent event,
    Emitter<AuthState> emit,
  ) {
    unawaited(_authRepository.signOut());
  }

  void _onSignInWithGoogle(
    AuthSignInWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final User user = await _authRepository.signInWithGoogle();
      emit(state.copyWith(
        userStatus: UserAuthStatuses.authenticated,
        user: user,
      ));
    } catch (e) {
      emit(state.copyWith(
        userStatus: UserAuthStatuses.unauthenticated,
        user: User.empty,
      ));
    }
  }
}
