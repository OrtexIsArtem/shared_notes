part of 'auth_bloc.dart';

enum UserAuthStatuses {
  authenticated,
  unauthenticated,
  unknown,
}

class AuthState {
  const AuthState({
    this.isLoading = false,
    this.userStatus = UserAuthStatuses.unknown,
    this.token,
    this.user = User.empty,
  });

  final bool isLoading;
  final String? token;
  final UserAuthStatuses userStatus;
  final User user;

  AuthState copyWith({
    bool? isLoading,
    String? token,
    UserAuthStatuses? userStatus,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? false,
      token: token ?? this.token,
      userStatus: userStatus ?? this.userStatus,
      user: user ?? this.user,
    );
  }
}
