import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:login_client/login_client.dart';

part 'sign_up_screen_cubit.freezed.dart';

class SignUpScreenCubit extends Cubit<SignUpScreenState> {
  SignUpScreenCubit({
    required CQRS cqrs,
    required AuthCubit authCubit,
  })  : _cqrs = cqrs,
        _authCubit = authCubit,
        super(const SignUpScreenInitialState());

  final CQRS _cqrs;
  final AuthCubit _authCubit;

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> registerUser(
    String email,
    String password,
  ) async {
    final res = await _cqrs.run(
      RegisterUser(
        userInfo: UserDTO(
          emailAddress: email,
          firstname: '',
          surname: '',
          username: email,
        ),
        password: password,
      ),
    );
    if (res.success) {
      await _authCubit.logIn(ResourceOwnerPasswordStrategy(email, password));
      emit(
        SignUpScreenSuccessState(
          email: email,
          password: password,
        ),
      );
    } else {
      emit(
        SignUpScreenErrorState(
          email: email,
          password: password,
        ),
      );
    }
  }
}

@freezed
class SignUpScreenState with _$SignUpScreenState {
  const factory SignUpScreenState.initial({
    @Default('') String email,
    @Default('') String password,
  }) = SignUpScreenInitialState;
  const factory SignUpScreenState.success({
    required String email,
    required String password,
  }) = SignUpScreenSuccessState;
  const factory SignUpScreenState.error({
    required String email,
    required String password,
  }) = SignUpScreenErrorState;
}
