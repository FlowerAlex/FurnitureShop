import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:login_client/login_client.dart';

part 'login_screen_cubit.freezed.dart';

class LogInScreenCubit extends Cubit<LogInScreenState> {
  LogInScreenCubit({
    required AuthCubit authCubit,
  })  : _authCubit = authCubit,
        super(const LogInScreenReadyState());

  final AuthCubit _authCubit;

  Future<void> logIn(
    String email,
    String password,
  ) async {
    emit(const LogInScreenReadyState(loading: true));
    try {
      await _authCubit.logIn(ResourceOwnerPasswordStrategy(email, password));
      emit(const LogInScreenReadyState());
    } on AuthorizationException {
      emit(const LogInScreenReadyState(invalidCredentials: true));
    } on SocketException {
      emit(const LogInScreenReadyState(networkError: true));
    } catch (e) {
      emit(
        LogInScreenReadyState(
          unknownError: true,
          errorText: e.toString(),
        ),
      );
    }
  }
}

@freezed
class LogInScreenState with _$LogInScreenState {
  const factory LogInScreenState.ready({
    @Default(false) bool loading,
    @Default(false) bool invalidCredentials,
    @Default(false) bool networkError,
    @Default(false) bool unknownError,
    @Default('') String errorText,
  }) = LogInScreenReadyState;
}
