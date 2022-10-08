import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/cqrs/app_cqrs.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:logging/logging.dart';

part 'profile_screen_cubit.freezed.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit({
    required AppCQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProfileScreenState.initial());

  final AppCQRS _cqrs;

  final _logger = Logger('ProfileScreenCubit');

  Future<void> fetch() async {
    state.maybeMap(
      success: (state) =>
          emit(ProfileScreenState.loading(userInfo: state.userInfo)),
      orElse: () => emit(const ProfileScreenState.loading()),
    );

    await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final res = await _cqrs.get(UserInfo());
      emit(ProfileScreenState.success(userInfo: res));
    } catch (err, st) {
      _logger.severe('Cant get user info', err, st);
      emit(ProfileScreenState.error(error: err.toString()));
    }
  }

  Future<void> updateProfile({
    String? username,
    String? name,
    String? surname,
    String? address,
  }) async {
    state.maybeMap(
      success: (state) =>
          emit(ProfileScreenState.loading(userInfo: state.userInfo)),
      orElse: () => emit(const ProfileScreenState.loading()),
    );
    try {
      final res = await _cqrs.run(
        UpdateProfile(
          firstname: name,
          surname: surname,
          username: username,
          address: address,
        ),
      );

      if (res.success) {
        await _fetch();
      }
    } catch (err, st) {
      _logger.severe("can't update profile", err, st);
      emit(ProfileScreenState.error(error: err.toString()));
    }
  }

  Future<void> addFunds(int fundsToAdd) async {
    final state = this.state;
    if (state is! ProfileScreenStateSuccess) {
      return;
    }

    try {
      final res = await _cqrs.run(
        AddFunds(
          fundsToAdd: fundsToAdd,
        ),
      );

      if (res.success) {
        await _fetch();
      }
    } catch (err, st) {
      _logger.severe("can't update profile", err, st);
      emit(ProfileScreenState.error(error: err.toString()));
    }
  }
}

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.initial() = ProfileScreenStateInitial;
  const factory ProfileScreenState.loading({
    UserInfoDTO? userInfo,
  }) = ProfileScreenStateLoading;
  const factory ProfileScreenState.success({
    required UserInfoDTO userInfo,
  }) = ProfileScreenStateSuccess;
  const factory ProfileScreenState.error({
    required String error,
  }) = ProfileScreenStateError;
}

extension ProfileScreenStateEx on ProfileScreenState {
  UserInfoDTO? get me {
    final state = this;
    if (state is ProfileScreenStateSuccess) {
      return state.userInfo;
    }
    if (state is ProfileScreenStateLoading) {
      return state.userInfo;
    }

    throw Exception('User is not accessible');
  }
}
