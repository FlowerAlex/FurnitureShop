// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UsersScreenStateTearOff {
  const _$UsersScreenStateTearOff();

  UsersScreenStateReady ready(
      {Map<int, List<UserInfoDTO>> users = const <int, List<UserInfoDTO>>{},
      int currentPage = 0,
      int totalCount = 0}) {
    return UsersScreenStateReady(
      users: users,
      currentPage: currentPage,
      totalCount: totalCount,
    );
  }

  UsersScreenStateError error({required String error}) {
    return UsersScreenStateError(
      error: error,
    );
  }
}

/// @nodoc
const $UsersScreenState = _$UsersScreenStateTearOff();

/// @nodoc
mixin _$UsersScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersScreenStateReady value) ready,
    required TResult Function(UsersScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersScreenStateCopyWith<$Res> {
  factory $UsersScreenStateCopyWith(
          UsersScreenState value, $Res Function(UsersScreenState) then) =
      _$UsersScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UsersScreenStateCopyWithImpl<$Res>
    implements $UsersScreenStateCopyWith<$Res> {
  _$UsersScreenStateCopyWithImpl(this._value, this._then);

  final UsersScreenState _value;
  // ignore: unused_field
  final $Res Function(UsersScreenState) _then;
}

/// @nodoc
abstract class $UsersScreenStateReadyCopyWith<$Res> {
  factory $UsersScreenStateReadyCopyWith(UsersScreenStateReady value,
          $Res Function(UsersScreenStateReady) then) =
      _$UsersScreenStateReadyCopyWithImpl<$Res>;
  $Res call(
      {Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount});
}

/// @nodoc
class _$UsersScreenStateReadyCopyWithImpl<$Res>
    extends _$UsersScreenStateCopyWithImpl<$Res>
    implements $UsersScreenStateReadyCopyWith<$Res> {
  _$UsersScreenStateReadyCopyWithImpl(
      UsersScreenStateReady _value, $Res Function(UsersScreenStateReady) _then)
      : super(_value, (v) => _then(v as UsersScreenStateReady));

  @override
  UsersScreenStateReady get _value => super._value as UsersScreenStateReady;

  @override
  $Res call({
    Object? users = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(UsersScreenStateReady(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<int, List<UserInfoDTO>>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UsersScreenStateReady implements UsersScreenStateReady {
  const _$UsersScreenStateReady(
      {this.users = const <int, List<UserInfoDTO>>{},
      this.currentPage = 0,
      this.totalCount = 0});

  @JsonKey()
  @override
  final Map<int, List<UserInfoDTO>> users;
  @JsonKey()
  @override
  final int currentPage;
  @JsonKey()
  @override
  final int totalCount;

  @override
  String toString() {
    return 'UsersScreenState.ready(users: $users, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersScreenStateReady &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  $UsersScreenStateReadyCopyWith<UsersScreenStateReady> get copyWith =>
      _$UsersScreenStateReadyCopyWithImpl<UsersScreenStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(users, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(users, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(users, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersScreenStateReady value) ready,
    required TResult Function(UsersScreenStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class UsersScreenStateReady implements UsersScreenState {
  const factory UsersScreenStateReady(
      {Map<int, List<UserInfoDTO>> users,
      int currentPage,
      int totalCount}) = _$UsersScreenStateReady;

  Map<int, List<UserInfoDTO>> get users;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  $UsersScreenStateReadyCopyWith<UsersScreenStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersScreenStateErrorCopyWith<$Res> {
  factory $UsersScreenStateErrorCopyWith(UsersScreenStateError value,
          $Res Function(UsersScreenStateError) then) =
      _$UsersScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$UsersScreenStateErrorCopyWithImpl<$Res>
    extends _$UsersScreenStateCopyWithImpl<$Res>
    implements $UsersScreenStateErrorCopyWith<$Res> {
  _$UsersScreenStateErrorCopyWithImpl(
      UsersScreenStateError _value, $Res Function(UsersScreenStateError) _then)
      : super(_value, (v) => _then(v as UsersScreenStateError));

  @override
  UsersScreenStateError get _value => super._value as UsersScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(UsersScreenStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UsersScreenStateError implements UsersScreenStateError {
  const _$UsersScreenStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'UsersScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $UsersScreenStateErrorCopyWith<UsersScreenStateError> get copyWith =>
      _$UsersScreenStateErrorCopyWithImpl<UsersScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<int, List<UserInfoDTO>> users, int currentPage, int totalCount)?
        ready,
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
    required TResult Function(UsersScreenStateReady value) ready,
    required TResult Function(UsersScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UsersScreenStateError implements UsersScreenState {
  const factory UsersScreenStateError({required String error}) =
      _$UsersScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  $UsersScreenStateErrorCopyWith<UsersScreenStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
