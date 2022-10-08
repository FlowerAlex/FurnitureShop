import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/cqrs/app_cqrs.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:login_client/login_client.dart';

part 'sign_up_screen_cubit.freezed.dart';

class SignUpScreenCubit extends Cubit<SignUpScreenState> {
  SignUpScreenCubit({
    required AppCQRS cqrs,
    required AuthCubit authCubit,
  })  : _cqrs = cqrs,
        _authCubit = authCubit,
        super(const SignUpScreenReadyState());

  final AppCQRS _cqrs;
  final AuthCubit _authCubit;

  Future<void> registerUser(
    String email,
    String password,
    String address,
  ) async {
    emit(const SignUpScreenReadyState(loading: true));
    try {
      final res = await _cqrs.run(
        RegisterUser(
          userInfo: UserInfoDTOBase(
            emailAddress: email,
            firstname: '',
            surname: '',
            username: email,
            address: address,
          ),
          password: password,
        ),
      );
      if (res.success) {
        await _authCubit.logIn(ResourceOwnerPasswordStrategy(email, password));
        emit(
          const SignUpScreenReadyState(),
        );
      } else {
        emit(
          const SignUpScreenReadyState(
            unknownError: true,
          ),
        ); // check different errorCodes
      }
    } on AuthorizationException {
      emit(const SignUpScreenReadyState(invalidCredentials: true));
    } on SocketException {
      emit(const SignUpScreenReadyState(networkError: true));
    } catch (e) {
      emit(const SignUpScreenReadyState(unknownError: true));
    }
  }
}

@freezed
class SignUpScreenState with _$SignUpScreenState {
  const factory SignUpScreenState.ready({
    @Default(false) bool loading,
    @Default(false) bool invalidCredentials,
    @Default(false) bool networkError,
    @Default(false) bool unknownError,
  }) = SignUpScreenReadyState;
}
