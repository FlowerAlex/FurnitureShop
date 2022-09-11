import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:login_client/login_client.dart';

part 'sign_up_screen_cubit.freezed.dart';

class SignUpScreenCubit extends Cubit<SignUpScreenState> {
  SignUpScreenCubit({
    required CQRS cqrs,
    required AuthCubit authCubit,
  })  : _cqrs = cqrs,
        _authCubit = authCubit,
        super(const SignUpScreenReadyState());

  final CQRS _cqrs;
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
          userInfo: UserInfoDTO(
            emailAddress: email,
            firstname: '',
            surname: '',
            username: email,
            address: address,
            funds: 0, // TODO: remove when backend will be fixed
            isBanned: false, // TODO: remove when backend will be fixed
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
        emit(const SignUpScreenReadyState(
            unknownError: true)); // check different errorCodes
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
