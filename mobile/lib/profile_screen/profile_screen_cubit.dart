import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';

part 'profile_screen_cubit.freezed.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProfileScreenInitialState());

  final CQRS _cqrs;

  Future<void> fetch() async {
    state.maybeMap(
      success: (state) =>
          emit(ProfileScreenLoadingState(userInfo: state.userInfo)),
      orElse: () => emit(const ProfileScreenLoadingState(userInfo: null)),
    );

    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final res = await _cqrs.get(UserInfo());
      emit(ProfileScreenSuccessState(userInfo: res));
    } catch (e) {
      emit(const ProfileScreenErrorState());
    }
  }

  Future<void> updateProfile({
    String? username,
    String? name,
    String? surname,
  }) async {
    state.maybeMap(
      success: (state) =>
          emit(ProfileScreenLoadingState(userInfo: state.userInfo)),
      orElse: () => emit(const ProfileScreenLoadingState(userInfo: null)),
    );
    try {
      final res = await _cqrs.run(
        UpdateProfile(
          firstname: name,
          surname: surname,
          username: username,
        ),
      );

      if (res.success) {
        await _fetch();
      }
    } catch (e) {
      emit(const ProfileScreenErrorState());
    }
  }
}

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.initial() = ProfileScreenInitialState;
  const factory ProfileScreenState.loading({
    UserInfoDTO? userInfo,
  }) = ProfileScreenLoadingState;
  const factory ProfileScreenState.success({
    required UserInfoDTO userInfo,
  }) = ProfileScreenSuccessState;
  const factory ProfileScreenState.error() = ProfileScreenErrorState;
}
