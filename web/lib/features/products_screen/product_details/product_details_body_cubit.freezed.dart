// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_details_body_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductDetailsBodyStateTearOff {
  const _$ProductDetailsBodyStateTearOff();

  ProductDetailsBodyStateReady ready({PlatformFile? currentFile}) {
    return ProductDetailsBodyStateReady(
      currentFile: currentFile,
    );
  }

  ProductDetailsBodyStateError error({required String error}) {
    return ProductDetailsBodyStateError(
      error: error,
    );
  }
}

/// @nodoc
const $ProductDetailsBodyState = _$ProductDetailsBodyStateTearOff();

/// @nodoc
mixin _$ProductDetailsBodyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformFile? currentFile) ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlatformFile? currentFile)? ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformFile? currentFile)? ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsBodyStateReady value) ready,
    required TResult Function(ProductDetailsBodyStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsBodyStateReady value)? ready,
    TResult Function(ProductDetailsBodyStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsBodyStateReady value)? ready,
    TResult Function(ProductDetailsBodyStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsBodyStateCopyWith<$Res> {
  factory $ProductDetailsBodyStateCopyWith(ProductDetailsBodyState value,
          $Res Function(ProductDetailsBodyState) then) =
      _$ProductDetailsBodyStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductDetailsBodyStateCopyWithImpl<$Res>
    implements $ProductDetailsBodyStateCopyWith<$Res> {
  _$ProductDetailsBodyStateCopyWithImpl(this._value, this._then);

  final ProductDetailsBodyState _value;
  // ignore: unused_field
  final $Res Function(ProductDetailsBodyState) _then;
}

/// @nodoc
abstract class $ProductDetailsBodyStateReadyCopyWith<$Res> {
  factory $ProductDetailsBodyStateReadyCopyWith(
          ProductDetailsBodyStateReady value,
          $Res Function(ProductDetailsBodyStateReady) then) =
      _$ProductDetailsBodyStateReadyCopyWithImpl<$Res>;
  $Res call({PlatformFile? currentFile});
}

/// @nodoc
class _$ProductDetailsBodyStateReadyCopyWithImpl<$Res>
    extends _$ProductDetailsBodyStateCopyWithImpl<$Res>
    implements $ProductDetailsBodyStateReadyCopyWith<$Res> {
  _$ProductDetailsBodyStateReadyCopyWithImpl(
      ProductDetailsBodyStateReady _value,
      $Res Function(ProductDetailsBodyStateReady) _then)
      : super(_value, (v) => _then(v as ProductDetailsBodyStateReady));

  @override
  ProductDetailsBodyStateReady get _value =>
      super._value as ProductDetailsBodyStateReady;

  @override
  $Res call({
    Object? currentFile = freezed,
  }) {
    return _then(ProductDetailsBodyStateReady(
      currentFile: currentFile == freezed
          ? _value.currentFile
          : currentFile // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
    ));
  }
}

/// @nodoc

class _$ProductDetailsBodyStateReady implements ProductDetailsBodyStateReady {
  const _$ProductDetailsBodyStateReady({this.currentFile});

  @override
  final PlatformFile? currentFile;

  @override
  String toString() {
    return 'ProductDetailsBodyState.ready(currentFile: $currentFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsBodyStateReady &&
            const DeepCollectionEquality()
                .equals(other.currentFile, currentFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentFile));

  @JsonKey(ignore: true)
  @override
  $ProductDetailsBodyStateReadyCopyWith<ProductDetailsBodyStateReady>
      get copyWith => _$ProductDetailsBodyStateReadyCopyWithImpl<
          ProductDetailsBodyStateReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformFile? currentFile) ready,
    required TResult Function(String error) error,
  }) {
    return ready(currentFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlatformFile? currentFile)? ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(currentFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformFile? currentFile)? ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(currentFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsBodyStateReady value) ready,
    required TResult Function(ProductDetailsBodyStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsBodyStateReady value)? ready,
    TResult Function(ProductDetailsBodyStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsBodyStateReady value)? ready,
    TResult Function(ProductDetailsBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsBodyStateReady implements ProductDetailsBodyState {
  const factory ProductDetailsBodyStateReady({PlatformFile? currentFile}) =
      _$ProductDetailsBodyStateReady;

  PlatformFile? get currentFile;
  @JsonKey(ignore: true)
  $ProductDetailsBodyStateReadyCopyWith<ProductDetailsBodyStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsBodyStateErrorCopyWith<$Res> {
  factory $ProductDetailsBodyStateErrorCopyWith(
          ProductDetailsBodyStateError value,
          $Res Function(ProductDetailsBodyStateError) then) =
      _$ProductDetailsBodyStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ProductDetailsBodyStateErrorCopyWithImpl<$Res>
    extends _$ProductDetailsBodyStateCopyWithImpl<$Res>
    implements $ProductDetailsBodyStateErrorCopyWith<$Res> {
  _$ProductDetailsBodyStateErrorCopyWithImpl(
      ProductDetailsBodyStateError _value,
      $Res Function(ProductDetailsBodyStateError) _then)
      : super(_value, (v) => _then(v as ProductDetailsBodyStateError));

  @override
  ProductDetailsBodyStateError get _value =>
      super._value as ProductDetailsBodyStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ProductDetailsBodyStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductDetailsBodyStateError implements ProductDetailsBodyStateError {
  const _$ProductDetailsBodyStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProductDetailsBodyState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsBodyStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ProductDetailsBodyStateErrorCopyWith<ProductDetailsBodyStateError>
      get copyWith => _$ProductDetailsBodyStateErrorCopyWithImpl<
          ProductDetailsBodyStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformFile? currentFile) ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlatformFile? currentFile)? ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformFile? currentFile)? ready,
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
    required TResult Function(ProductDetailsBodyStateReady value) ready,
    required TResult Function(ProductDetailsBodyStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsBodyStateReady value)? ready,
    TResult Function(ProductDetailsBodyStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsBodyStateReady value)? ready,
    TResult Function(ProductDetailsBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsBodyStateError implements ProductDetailsBodyState {
  const factory ProductDetailsBodyStateError({required String error}) =
      _$ProductDetailsBodyStateError;

  String get error;
  @JsonKey(ignore: true)
  $ProductDetailsBodyStateErrorCopyWith<ProductDetailsBodyStateError>
      get copyWith => throw _privateConstructorUsedError;
}
