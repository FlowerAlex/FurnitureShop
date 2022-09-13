import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_client/login_client.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginClient)
      : super(
          _loginClient.loggedIn
              ? const AuthLoggedInState()
              : const AuthLoggedOutState(),
        );

  final LoginClient _loginClient;

  StreamSubscription? _tokenChangesSubscription;

  Future<void> initialize() async {
    await _tokenChangesSubscription?.cancel();

    _tokenChangesSubscription = _loginClient.onCredentialsChanged.listen(
      (credentials) async {
        if (credentials != null) {
          emit(const AuthLoggedInState());
        } else {
          emit(const AuthLoggedOutState());
        }
      },
    );
  }

  Future<void> logIn(AuthorizationStrategy strategy) =>
      _loginClient.logIn(strategy);

  Future<void> logOut() => _loginClient.logOut();

  @override
  Future<void> close() async {
    await _tokenChangesSubscription?.cancel();
    await super.close();
  }
}

abstract class AuthState {
  const AuthState();
}

class AuthLoggedInState extends AuthState {
  const AuthLoggedInState();
}

class AuthLoggedOutState extends AuthState {
  const AuthLoggedOutState();
}
