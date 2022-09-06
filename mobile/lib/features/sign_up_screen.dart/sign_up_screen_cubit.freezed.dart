// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpScreenStateTearOff {
  const _$SignUpScreenStateTearOff();

  SignUpScreenReadyState ready(
      {bool loading = false,
      bool invalidCredentials = false,
      bool networkError = false,
      bool unknownError = false}) {
    return SignUpScreenReadyState(
      loading: loading,
      invalidCredentials: invalidCredentials,
      networkError: networkError,
      unknownError: unknownError,
    );
  }
}

/// @nodoc
const $SignUpScreenState = _$SignUpScreenStateTearOff();

/// @nodoc
mixin _$SignUpScreenState {
  bool get loading => throw _privateConstructorUsedError;
  bool get invalidCredentials => throw _privateConstructorUsedError;
  bool get networkError => throw _privateConstructorUsedError;
  bool get unknownError => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, bool invalidCredentials,
            bool networkError, bool unknownError)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenReadyState value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignUpScreenReadyState value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenReadyState value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpScreenStateCopyWith<SignUpScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenStateCopyWith(
          SignUpScreenState value, $Res Function(SignUpScreenState) then) =
      _$SignUpScreenStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      bool invalidCredentials,
      bool networkError,
      bool unknownError});
}

/// @nodoc
class _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  _$SignUpScreenStateCopyWithImpl(this._value, this._then);

  final SignUpScreenState _value;
  // ignore: unused_field
  final $Res Function(SignUpScreenState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? invalidCredentials = freezed,
    Object? networkError = freezed,
    Object? unknownError = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      networkError: networkError == freezed
          ? _value.networkError
          : networkError // ignore: cast_nullable_to_non_nullable
              as bool,
      unknownError: unknownError == freezed
          ? _value.unknownError
          : unknownError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $SignUpScreenReadyStateCopyWith<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenReadyStateCopyWith(SignUpScreenReadyState value,
          $Res Function(SignUpScreenReadyState) then) =
      _$SignUpScreenReadyStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      bool invalidCredentials,
      bool networkError,
      bool unknownError});
}

/// @nodoc
class _$SignUpScreenReadyStateCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenReadyStateCopyWith<$Res> {
  _$SignUpScreenReadyStateCopyWithImpl(SignUpScreenReadyState _value,
      $Res Function(SignUpScreenReadyState) _then)
      : super(_value, (v) => _then(v as SignUpScreenReadyState));

  @override
  SignUpScreenReadyState get _value => super._value as SignUpScreenReadyState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? invalidCredentials = freezed,
    Object? networkError = freezed,
    Object? unknownError = freezed,
  }) {
    return _then(SignUpScreenReadyState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      networkError: networkError == freezed
          ? _value.networkError
          : networkError // ignore: cast_nullable_to_non_nullable
              as bool,
      unknownError: unknownError == freezed
          ? _value.unknownError
          : unknownError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignUpScreenReadyState implements SignUpScreenReadyState {
  const _$SignUpScreenReadyState(
      {this.loading = false,
      this.invalidCredentials = false,
      this.networkError = false,
      this.unknownError = false});

  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final bool invalidCredentials;
  @JsonKey()
  @override
  final bool networkError;
  @JsonKey()
  @override
  final bool unknownError;

  @override
  String toString() {
    return 'SignUpScreenState.ready(loading: $loading, invalidCredentials: $invalidCredentials, networkError: $networkError, unknownError: $unknownError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpScreenReadyState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.invalidCredentials, invalidCredentials) &&
            const DeepCollectionEquality()
                .equals(other.networkError, networkError) &&
            const DeepCollectionEquality()
                .equals(other.unknownError, unknownError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(invalidCredentials),
      const DeepCollectionEquality().hash(networkError),
      const DeepCollectionEquality().hash(unknownError));

  @JsonKey(ignore: true)
  @override
  $SignUpScreenReadyStateCopyWith<SignUpScreenReadyState> get copyWith =>
      _$SignUpScreenReadyStateCopyWithImpl<SignUpScreenReadyState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, bool invalidCredentials,
            bool networkError, bool unknownError)
        ready,
  }) {
    return ready(loading, invalidCredentials, networkError, unknownError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError)?
        ready,
  }) {
    return ready?.call(loading, invalidCredentials, networkError, unknownError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(loading, invalidCredentials, networkError, unknownError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenReadyState value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignUpScreenReadyState value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenReadyState value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenReadyState implements SignUpScreenState {
  const factory SignUpScreenReadyState(
      {bool loading,
      bool invalidCredentials,
      bool networkError,
      bool unknownError}) = _$SignUpScreenReadyState;

  @override
  bool get loading;
  @override
  bool get invalidCredentials;
  @override
  bool get networkError;
  @override
  bool get unknownError;
  @override
  @JsonKey(ignore: true)
  $SignUpScreenReadyStateCopyWith<SignUpScreenReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}
