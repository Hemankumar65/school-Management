import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_dev/students/studentModel/student_model.dart';

import '../repository/authentication_repository/auth_repository.dart';
import '../repository/user_repository/models/user.dart';
import '../repository/user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<FetchUserData>(_onFetchUserData);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        return emit(
          user != null
              ? AuthenticationState.authenticated(user as User, null)
              : const AuthenticationState.unauthenticated(),
        );
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  Future<void> _onFetchUserData(
    FetchUserData event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final currentUser = _authenticationRepository.getCurrentUser();
      if (currentUser != null) {
        final userData = await _fetchUserData(currentUser.email!);
        if (userData != null) {
          emit(AuthenticationState.authenticated(
              currentUser, userData as Map<String, dynamic>?));
        }
      }
    } catch (e) {
      print('Failed to fetch user data: ${e.toString()}');
    }
  }

  Future<UserBase?> _tryGetUser() async {
    try {
      final currentUser = _authenticationRepository.getCurrentUser();
      if (currentUser != null) {
        return await _fetchUserData(currentUser.email!);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<UserBase?> _fetchUserData(String email) async {
    final userType = await _userRepository.getUser(email);
    switch (userType) {
      case UserType.student:
        return await _userRepository.getStudentData(email);
      case UserType.teacher:
        return await _userRepository.getTeacherData(email);
      default:
        return null;
    }
  }
}
