// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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

  ProfileScreenStateInitial initial() {
    return const ProfileScreenStateInitial();
  }

  ProfileScreenStateLoading loading({UserInfoDTO? userInfo}) {
    return ProfileScreenStateLoading(
      userInfo: userInfo,
    );
  }

  ProfileScreenStateSuccess success({required UserInfoDTO userInfo}) {
    return ProfileScreenStateSuccess(
      userInfo: userInfo,
    );
  }

  ProfileScreenStateError error({required String error}) {
    return ProfileScreenStateError(
      error: error,
    );
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
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileScreenStateInitial value) initial,
    required TResult Function(ProfileScreenStateLoading value) loading,
    required TResult Function(ProfileScreenStateSuccess value) success,
    required TResult Function(ProfileScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
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
abstract class $ProfileScreenStateInitialCopyWith<$Res> {
  factory $ProfileScreenStateInitialCopyWith(ProfileScreenStateInitial value,
          $Res Function(ProfileScreenStateInitial) then) =
      _$ProfileScreenStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileScreenStateInitialCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenStateInitialCopyWith<$Res> {
  _$ProfileScreenStateInitialCopyWithImpl(ProfileScreenStateInitial _value,
      $Res Function(ProfileScreenStateInitial) _then)
      : super(_value, (v) => _then(v as ProfileScreenStateInitial));

  @override
  ProfileScreenStateInitial get _value =>
      super._value as ProfileScreenStateInitial;
}

/// @nodoc

class _$ProfileScreenStateInitial implements ProfileScreenStateInitial {
  const _$ProfileScreenStateInitial();

  @override
  String toString() {
    return 'ProfileScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
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
    required TResult Function(ProfileScreenStateInitial value) initial,
    required TResult Function(ProfileScreenStateLoading value) loading,
    required TResult Function(ProfileScreenStateSuccess value) success,
    required TResult Function(ProfileScreenStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenStateInitial implements ProfileScreenState {
  const factory ProfileScreenStateInitial() = _$ProfileScreenStateInitial;
}

/// @nodoc
abstract class $ProfileScreenStateLoadingCopyWith<$Res> {
  factory $ProfileScreenStateLoadingCopyWith(ProfileScreenStateLoading value,
          $Res Function(ProfileScreenStateLoading) then) =
      _$ProfileScreenStateLoadingCopyWithImpl<$Res>;
  $Res call({UserInfoDTO? userInfo});
}

/// @nodoc
class _$ProfileScreenStateLoadingCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenStateLoadingCopyWith<$Res> {
  _$ProfileScreenStateLoadingCopyWithImpl(ProfileScreenStateLoading _value,
      $Res Function(ProfileScreenStateLoading) _then)
      : super(_value, (v) => _then(v as ProfileScreenStateLoading));

  @override
  ProfileScreenStateLoading get _value =>
      super._value as ProfileScreenStateLoading;

  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(ProfileScreenStateLoading(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoDTO?,
    ));
  }
}

/// @nodoc

class _$ProfileScreenStateLoading implements ProfileScreenStateLoading {
  const _$ProfileScreenStateLoading({this.userInfo});

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
            other is ProfileScreenStateLoading &&
            const DeepCollectionEquality().equals(other.userInfo, userInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userInfo));

  @JsonKey(ignore: true)
  @override
  $ProfileScreenStateLoadingCopyWith<ProfileScreenStateLoading> get copyWith =>
      _$ProfileScreenStateLoadingCopyWithImpl<ProfileScreenStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function(String error) error,
  }) {
    return loading(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
  }) {
    return loading?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
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
    required TResult Function(ProfileScreenStateInitial value) initial,
    required TResult Function(ProfileScreenStateLoading value) loading,
    required TResult Function(ProfileScreenStateSuccess value) success,
    required TResult Function(ProfileScreenStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenStateLoading implements ProfileScreenState {
  const factory ProfileScreenStateLoading({UserInfoDTO? userInfo}) =
      _$ProfileScreenStateLoading;

  UserInfoDTO? get userInfo;
  @JsonKey(ignore: true)
  $ProfileScreenStateLoadingCopyWith<ProfileScreenStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenStateSuccessCopyWith<$Res> {
  factory $ProfileScreenStateSuccessCopyWith(ProfileScreenStateSuccess value,
          $Res Function(ProfileScreenStateSuccess) then) =
      _$ProfileScreenStateSuccessCopyWithImpl<$Res>;
  $Res call({UserInfoDTO userInfo});
}

/// @nodoc
class _$ProfileScreenStateSuccessCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenStateSuccessCopyWith<$Res> {
  _$ProfileScreenStateSuccessCopyWithImpl(ProfileScreenStateSuccess _value,
      $Res Function(ProfileScreenStateSuccess) _then)
      : super(_value, (v) => _then(v as ProfileScreenStateSuccess));

  @override
  ProfileScreenStateSuccess get _value =>
      super._value as ProfileScreenStateSuccess;

  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(ProfileScreenStateSuccess(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoDTO,
    ));
  }
}

/// @nodoc

class _$ProfileScreenStateSuccess implements ProfileScreenStateSuccess {
  const _$ProfileScreenStateSuccess({required this.userInfo});

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
            other is ProfileScreenStateSuccess &&
            const DeepCollectionEquality().equals(other.userInfo, userInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userInfo));

  @JsonKey(ignore: true)
  @override
  $ProfileScreenStateSuccessCopyWith<ProfileScreenStateSuccess> get copyWith =>
      _$ProfileScreenStateSuccessCopyWithImpl<ProfileScreenStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function(String error) error,
  }) {
    return success(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
  }) {
    return success?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
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
    required TResult Function(ProfileScreenStateInitial value) initial,
    required TResult Function(ProfileScreenStateLoading value) loading,
    required TResult Function(ProfileScreenStateSuccess value) success,
    required TResult Function(ProfileScreenStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenStateSuccess implements ProfileScreenState {
  const factory ProfileScreenStateSuccess({required UserInfoDTO userInfo}) =
      _$ProfileScreenStateSuccess;

  UserInfoDTO get userInfo;
  @JsonKey(ignore: true)
  $ProfileScreenStateSuccessCopyWith<ProfileScreenStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenStateErrorCopyWith<$Res> {
  factory $ProfileScreenStateErrorCopyWith(ProfileScreenStateError value,
          $Res Function(ProfileScreenStateError) then) =
      _$ProfileScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ProfileScreenStateErrorCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res>
    implements $ProfileScreenStateErrorCopyWith<$Res> {
  _$ProfileScreenStateErrorCopyWithImpl(ProfileScreenStateError _value,
      $Res Function(ProfileScreenStateError) _then)
      : super(_value, (v) => _then(v as ProfileScreenStateError));

  @override
  ProfileScreenStateError get _value => super._value as ProfileScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ProfileScreenStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileScreenStateError implements ProfileScreenStateError {
  const _$ProfileScreenStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProfileScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ProfileScreenStateErrorCopyWith<ProfileScreenStateError> get copyWith =>
      _$ProfileScreenStateErrorCopyWithImpl<ProfileScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoDTO? userInfo) loading,
    required TResult Function(UserInfoDTO userInfo) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoDTO? userInfo)? loading,
    TResult Function(UserInfoDTO userInfo)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileScreenStateInitial value) initial,
    required TResult Function(ProfileScreenStateLoading value) loading,
    required TResult Function(ProfileScreenStateSuccess value) success,
    required TResult Function(ProfileScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileScreenStateInitial value)? initial,
    TResult Function(ProfileScreenStateLoading value)? loading,
    TResult Function(ProfileScreenStateSuccess value)? success,
    TResult Function(ProfileScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileScreenStateError implements ProfileScreenState {
  const factory ProfileScreenStateError({required String error}) =
      _$ProfileScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  $ProfileScreenStateErrorCopyWith<ProfileScreenStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
