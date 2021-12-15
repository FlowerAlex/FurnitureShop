// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

  SignUpScreenInitialState initial({String email = '', String password = ''}) {
    return SignUpScreenInitialState(
      email: email,
      password: password,
    );
  }

  SignUpScreenSuccessState success(
      {required String email, required String password}) {
    return SignUpScreenSuccessState(
      email: email,
      password: password,
    );
  }

  SignUpScreenErrorState error(
      {required String email, required String password}) {
    return SignUpScreenErrorState(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $SignUpScreenState = _$SignUpScreenStateTearOff();

/// @nodoc
mixin _$SignUpScreenState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) success,
    required TResult Function(String email, String password) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenInitialState value) initial,
    required TResult Function(SignUpScreenSuccessState value) success,
    required TResult Function(SignUpScreenErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
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
  $Res call({String email, String password});
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
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $SignUpScreenInitialStateCopyWith<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenInitialStateCopyWith(SignUpScreenInitialState value,
          $Res Function(SignUpScreenInitialState) then) =
      _$SignUpScreenInitialStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class _$SignUpScreenInitialStateCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenInitialStateCopyWith<$Res> {
  _$SignUpScreenInitialStateCopyWithImpl(SignUpScreenInitialState _value,
      $Res Function(SignUpScreenInitialState) _then)
      : super(_value, (v) => _then(v as SignUpScreenInitialState));

  @override
  SignUpScreenInitialState get _value =>
      super._value as SignUpScreenInitialState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(SignUpScreenInitialState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpScreenInitialState implements SignUpScreenInitialState {
  const _$SignUpScreenInitialState({this.email = '', this.password = ''});

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpScreenState.initial(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpScreenInitialState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  $SignUpScreenInitialStateCopyWith<SignUpScreenInitialState> get copyWith =>
      _$SignUpScreenInitialStateCopyWithImpl<SignUpScreenInitialState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) success,
    required TResult Function(String email, String password) error,
  }) {
    return initial(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
  }) {
    return initial?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenInitialState value) initial,
    required TResult Function(SignUpScreenSuccessState value) success,
    required TResult Function(SignUpScreenErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenInitialState implements SignUpScreenState {
  const factory SignUpScreenInitialState({String email, String password}) =
      _$SignUpScreenInitialState;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  $SignUpScreenInitialStateCopyWith<SignUpScreenInitialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpScreenSuccessStateCopyWith<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenSuccessStateCopyWith(SignUpScreenSuccessState value,
          $Res Function(SignUpScreenSuccessState) then) =
      _$SignUpScreenSuccessStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class _$SignUpScreenSuccessStateCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenSuccessStateCopyWith<$Res> {
  _$SignUpScreenSuccessStateCopyWithImpl(SignUpScreenSuccessState _value,
      $Res Function(SignUpScreenSuccessState) _then)
      : super(_value, (v) => _then(v as SignUpScreenSuccessState));

  @override
  SignUpScreenSuccessState get _value =>
      super._value as SignUpScreenSuccessState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(SignUpScreenSuccessState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpScreenSuccessState implements SignUpScreenSuccessState {
  const _$SignUpScreenSuccessState(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpScreenState.success(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpScreenSuccessState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  $SignUpScreenSuccessStateCopyWith<SignUpScreenSuccessState> get copyWith =>
      _$SignUpScreenSuccessStateCopyWithImpl<SignUpScreenSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) success,
    required TResult Function(String email, String password) error,
  }) {
    return success(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
  }) {
    return success?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenInitialState value) initial,
    required TResult Function(SignUpScreenSuccessState value) success,
    required TResult Function(SignUpScreenErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenSuccessState implements SignUpScreenState {
  const factory SignUpScreenSuccessState(
      {required String email,
      required String password}) = _$SignUpScreenSuccessState;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  $SignUpScreenSuccessStateCopyWith<SignUpScreenSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpScreenErrorStateCopyWith<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenErrorStateCopyWith(SignUpScreenErrorState value,
          $Res Function(SignUpScreenErrorState) then) =
      _$SignUpScreenErrorStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class _$SignUpScreenErrorStateCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenErrorStateCopyWith<$Res> {
  _$SignUpScreenErrorStateCopyWithImpl(SignUpScreenErrorState _value,
      $Res Function(SignUpScreenErrorState) _then)
      : super(_value, (v) => _then(v as SignUpScreenErrorState));

  @override
  SignUpScreenErrorState get _value => super._value as SignUpScreenErrorState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(SignUpScreenErrorState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpScreenErrorState implements SignUpScreenErrorState {
  const _$SignUpScreenErrorState({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpScreenState.error(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpScreenErrorState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  $SignUpScreenErrorStateCopyWith<SignUpScreenErrorState> get copyWith =>
      _$SignUpScreenErrorStateCopyWithImpl<SignUpScreenErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) success,
    required TResult Function(String email, String password) error,
  }) {
    return error(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
  }) {
    return error?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? success,
    TResult Function(String email, String password)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenInitialState value) initial,
    required TResult Function(SignUpScreenSuccessState value) success,
    required TResult Function(SignUpScreenErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenInitialState value)? initial,
    TResult Function(SignUpScreenSuccessState value)? success,
    TResult Function(SignUpScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenErrorState implements SignUpScreenState {
  const factory SignUpScreenErrorState(
      {required String email,
      required String password}) = _$SignUpScreenErrorState;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  $SignUpScreenErrorStateCopyWith<SignUpScreenErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
