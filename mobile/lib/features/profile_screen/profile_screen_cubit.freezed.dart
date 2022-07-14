// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileScreenStateTearOff {
  const _$ProfileScreenStateTearOff();

  ProfileScreenInitialState initial() {
    return const ProfileScreenInitialState();
  }

  ProfileScreenLoadingState loading({UserInfoDTO? userInfo}) {
    return ProfileScreenLoadingState(
      userInfo: userInfo,
    );
  }

  ProfileScreenSuccessState success({required UserInfoDTO userInfo}) {
    return ProfileScreenSuccessState(
      userInfo: userInfo,
    );
  }

  ProfileScreenErrorState error() {
    return const ProfileScreenErrorState();
  }
}

/// @nodoc
const $ProfileScreenState = _$ProfileScreenStateTearOff();

/// @nodoc
mixin _$ProfileScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileScreenInitialState value) initial,
    required TResult Function(ProfileScreenLoadingState value) loading,
    required TResult Function(ProfileScreenSuccessState value) success,
    required TResult Function(ProfileScreenErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenStateCopyWith<$Res> {
  factory $ProfileScreenStateCopyWith(
          ProfileScreenState value, $Res Function(ProfileScreenState) then) =
      _$ProfileScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenStateCopyWith<$Res> {
  _$ProfileScreenStateCopyWithImpl(this._value, this._then);

  final ProfileScreenState _value;
  // ignore: unused_field
  final $Res Function(ProfileScreenState) _then;
}

/// @nodoc
abstract class $ProfileScreenInitialStateCopyWith<$Res> {
  factory $ProfileScreenInitialStateCopyWith(ProfileScreenInitialState value,
          $Res Function(ProfileScreenInitialState) then) =
      _$ProfileScreenInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileScreenInitialStateCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenInitialStateCopyWith<$Res> {
  _$ProfileScreenInitialStateCopyWithImpl(ProfileScreenInitialState _value,
      $Res Function(ProfileScreenInitialState) _then)
      : super(_value, (v) => _then(v as ProfileScreenInitialState));

  @override
  ProfileScreenInitialState get _value =>
      super._value as ProfileScreenInitialState;
}

/// @nodoc

class _$ProfileScreenInitialState implements ProfileScreenInitialState {
  const _$ProfileScreenInitialState();

  @override
  String toString() {
    return 'ProfileScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileScreenInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileScreenInitialState value) initial,
    required TResult Function(ProfileScreenLoadingState value) loading,
    required TResult Function(ProfileScreenSuccessState value) success,
    required TResult Function(ProfileScreenErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenInitialState implements ProfileScreenState {
  const factory ProfileScreenInitialState() = _$ProfileScreenInitialState;
}

/// @nodoc
abstract class $ProfileScreenLoadingStateCopyWith<$Res> {
  factory $ProfileScreenLoadingStateCopyWith(ProfileScreenLoadingState value,
          $Res Function(ProfileScreenLoadingState) then) =
      _$ProfileScreenLoadingStateCopyWithImpl<$Res>;
  $Res call({UserInfoDTO? userInfo});
}

/// @nodoc
class _$ProfileScreenLoadingStateCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenLoadingStateCopyWith<$Res> {
  _$ProfileScreenLoadingStateCopyWithImpl(ProfileScreenLoadingState _value,
      $Res Function(ProfileScreenLoadingState) _then)
      : super(_value, (v) => _then(v as ProfileScreenLoadingState));

  @override
  ProfileScreenLoadingState get _value =>
      super._value as ProfileScreenLoadingState;

  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(ProfileScreenLoadingState(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoDTO?,
    ));
  }
}

/// @nodoc

class _$ProfileScreenLoadingState implements ProfileScreenLoadingState {
  const _$ProfileScreenLoadingState({this.userInfo});

  @override
  final UserInfoDTO? userInfo;

  @override
  String toString() {
    return 'ProfileScreenState.loading(userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileScreenLoadingState &&
            const DeepCollectionEquality().equals(other.userInfo, userInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userInfo));

  @JsonKey(ignore: true)
  @override
  $ProfileScreenLoadingStateCopyWith<ProfileScreenLoadingState> get copyWith =>
      _$ProfileScreenLoadingStateCopyWithImpl<ProfileScreenLoadingState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function() error,
  }) {
    return loading(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
  }) {
    return loading?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(userInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileScreenInitialState value) initial,
    required TResult Function(ProfileScreenLoadingState value) loading,
    required TResult Function(ProfileScreenSuccessState value) success,
    required TResult Function(ProfileScreenErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenLoadingState implements ProfileScreenState {
  const factory ProfileScreenLoadingState({UserInfoDTO? userInfo}) =
      _$ProfileScreenLoadingState;

  UserInfoDTO? get userInfo;
  @JsonKey(ignore: true)
  $ProfileScreenLoadingStateCopyWith<ProfileScreenLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenSuccessStateCopyWith<$Res> {
  factory $ProfileScreenSuccessStateCopyWith(ProfileScreenSuccessState value,
          $Res Function(ProfileScreenSuccessState) then) =
      _$ProfileScreenSuccessStateCopyWithImpl<$Res>;
  $Res call({UserInfoDTO userInfo});
}

/// @nodoc
class _$ProfileScreenSuccessStateCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenSuccessStateCopyWith<$Res> {
  _$ProfileScreenSuccessStateCopyWithImpl(ProfileScreenSuccessState _value,
      $Res Function(ProfileScreenSuccessState) _then)
      : super(_value, (v) => _then(v as ProfileScreenSuccessState));

  @override
  ProfileScreenSuccessState get _value =>
      super._value as ProfileScreenSuccessState;

  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(ProfileScreenSuccessState(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoDTO,
    ));
  }
}

/// @nodoc

class _$ProfileScreenSuccessState implements ProfileScreenSuccessState {
  const _$ProfileScreenSuccessState({required this.userInfo});

  @override
  final UserInfoDTO userInfo;

  @override
  String toString() {
    return 'ProfileScreenState.success(userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileScreenSuccessState &&
            const DeepCollectionEquality().equals(other.userInfo, userInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userInfo));

  @JsonKey(ignore: true)
  @override
  $ProfileScreenSuccessStateCopyWith<ProfileScreenSuccessState> get copyWith =>
      _$ProfileScreenSuccessStateCopyWithImpl<ProfileScreenSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function() error,
  }) {
    return success(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
  }) {
    return success?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(userInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileScreenInitialState value) initial,
    required TResult Function(ProfileScreenLoadingState value) loading,
    required TResult Function(ProfileScreenSuccessState value) success,
    required TResult Function(ProfileScreenErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenSuccessState implements ProfileScreenState {
  const factory ProfileScreenSuccessState({required UserInfoDTO userInfo}) =
      _$ProfileScreenSuccessState;

  UserInfoDTO get userInfo;
  @JsonKey(ignore: true)
  $ProfileScreenSuccessStateCopyWith<ProfileScreenSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenErrorStateCopyWith<$Res> {
  factory $ProfileScreenErrorStateCopyWith(ProfileScreenErrorState value,
          $Res Function(ProfileScreenErrorState) then) =
      _$ProfileScreenErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileScreenErrorStateCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenErrorStateCopyWith<$Res> {
  _$ProfileScreenErrorStateCopyWithImpl(ProfileScreenErrorState _value,
      $Res Function(ProfileScreenErrorState) _then)
      : super(_value, (v) => _then(v as ProfileScreenErrorState));

  @override
  ProfileScreenErrorState get _value => super._value as ProfileScreenErrorState;
}

/// @nodoc

class _$ProfileScreenErrorState implements ProfileScreenErrorState {
  const _$ProfileScreenErrorState();

  @override
  String toString() {
    return 'ProfileScreenState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileScreenErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileScreenInitialState value) initial,
    required TResult Function(ProfileScreenLoadingState value) loading,
    required TResult Function(ProfileScreenSuccessState value) success,
    required TResult Function(ProfileScreenErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenInitialState value)? initial,
    TResult Function(ProfileScreenLoadingState value)? loading,
    TResult Function(ProfileScreenSuccessState value)? success,
    TResult Function(ProfileScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenErrorState implements ProfileScreenState {
  const factory ProfileScreenErrorState() = _$ProfileScreenErrorState;
}
