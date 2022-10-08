import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_client/login_client.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginClient)
      : super(
          _loginClient.loggedIn ? AuthState.loggedIn : AuthState.loggedOut,
        );

  final LoginClient _loginClient;

  StreamSubscription? _tokenChangesSubscription;

  Future<void> initialize() async {
    await _tokenChangesSubscription?.cancel();

    _tokenChangesSubscription = _loginClient.onCredentialsChanged.listen(
      (credentials) async {
        if (credentials != null) {
          emit(AuthState.loggedIn);
        } else {
          emit(AuthState.loggedOut);
        }
      },
    );
  }

  Future<void> logIn(AuthorizationStrategy strategy) =>
      _loginClient.logIn(strategy);

  Future<void> logOut() => _loginClient.logOut();

  void updateState(AuthState state) {
    emit(state);
  }

  @override
  Future<void> close() async {
    await _tokenChangesSubscription?.cancel();
    await super.close();
  }
}

enum AuthState {
  loggedIn,
  loggedOut,
  banned,
}
