part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
    this.userData,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user,
      [Map<String, dynamic>? userData])
      : this._(
            status: AuthenticationStatus.authenticated,
            user: user,
            userData: userData);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User? user;
  final Map<String, dynamic>? userData;
  @override
  List<Object?> get props => [status, user, userData];
}
