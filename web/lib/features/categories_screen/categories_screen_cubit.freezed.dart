// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoriesScreenStateTearOff {
  const _$CategoriesScreenStateTearOff();

  CategoriesScreenStateReady ready(
      {Map<int, List<CategoryDTO>> categories =
          const <int, List<CategoryDTO>>{},
      int currentPage = 0,
      int totalCount = 0}) {
    return CategoriesScreenStateReady(
      categories: categories,
      currentPage: currentPage,
      totalCount: totalCount,
    );
  }

  CategoriesScreenStateError error({required String error}) {
    return CategoriesScreenStateError(
      error: error,
    );
  }
}

/// @nodoc
const $CategoriesScreenState = _$CategoriesScreenStateTearOff();

/// @nodoc
mixin _$CategoriesScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, List<CategoryDTO>> categories,
            int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<int, List<CategoryDTO>> categories, int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, List<CategoryDTO>> categories, int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesScreenStateReady value) ready,
    required TResult Function(CategoriesScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoriesScreenStateReady value)? ready,
    TResult Function(CategoriesScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesScreenStateReady value)? ready,
    TResult Function(CategoriesScreenStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesScreenStateCopyWith<$Res> {
  factory $CategoriesScreenStateCopyWith(CategoriesScreenState value,
          $Res Function(CategoriesScreenState) then) =
      _$CategoriesScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoriesScreenStateCopyWithImpl<$Res>
    implements $CategoriesScreenStateCopyWith<$Res> {
  _$CategoriesScreenStateCopyWithImpl(this._value, this._then);

  final CategoriesScreenState _value;
  // ignore: unused_field
  final $Res Function(CategoriesScreenState) _then;
}

/// @nodoc
abstract class $CategoriesScreenStateReadyCopyWith<$Res> {
  factory $CategoriesScreenStateReadyCopyWith(CategoriesScreenStateReady value,
          $Res Function(CategoriesScreenStateReady) then) =
      _$CategoriesScreenStateReadyCopyWithImpl<$Res>;
  $Res call(
      {Map<int, List<CategoryDTO>> categories,
      int currentPage,
      int totalCount});
}

/// @nodoc
class _$CategoriesScreenStateReadyCopyWithImpl<$Res>
    extends _$CategoriesScreenStateCopyWithImpl<$Res>
    implements $CategoriesScreenStateReadyCopyWith<$Res> {
  _$CategoriesScreenStateReadyCopyWithImpl(CategoriesScreenStateReady _value,
      $Res Function(CategoriesScreenStateReady) _then)
      : super(_value, (v) => _then(v as CategoriesScreenStateReady));

  @override
  CategoriesScreenStateReady get _value =>
      super._value as CategoriesScreenStateReady;

  @override
  $Res call({
    Object? categories = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(CategoriesScreenStateReady(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<int, List<CategoryDTO>>,
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

class _$CategoriesScreenStateReady implements CategoriesScreenStateReady {
  const _$CategoriesScreenStateReady(
      {this.categories = const <int, List<CategoryDTO>>{},
      this.currentPage = 0,
      this.totalCount = 0});

  @JsonKey()
  @override
  final Map<int, List<CategoryDTO>> categories;
  @JsonKey()
  @override
  final int currentPage;
  @JsonKey()
  @override
  final int totalCount;

  @override
  String toString() {
    return 'CategoriesScreenState.ready(categories: $categories, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesScreenStateReady &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  $CategoriesScreenStateReadyCopyWith<CategoriesScreenStateReady>
      get copyWith =>
          _$CategoriesScreenStateReadyCopyWithImpl<CategoriesScreenStateReady>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, List<CategoryDTO>> categories,
            int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<int, List<CategoryDTO>> categories, int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, List<CategoryDTO>> categories, int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(categories, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesScreenStateReady value) ready,
    required TResult Function(CategoriesScreenStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoriesScreenStateReady value)? ready,
    TResult Function(CategoriesScreenStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesScreenStateReady value)? ready,
    TResult Function(CategoriesScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class CategoriesScreenStateReady implements CategoriesScreenState {
  const factory CategoriesScreenStateReady(
      {Map<int, List<CategoryDTO>> categories,
      int currentPage,
      int totalCount}) = _$CategoriesScreenStateReady;

  Map<int, List<CategoryDTO>> get categories;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  $CategoriesScreenStateReadyCopyWith<CategoriesScreenStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesScreenStateErrorCopyWith<$Res> {
  factory $CategoriesScreenStateErrorCopyWith(CategoriesScreenStateError value,
          $Res Function(CategoriesScreenStateError) then) =
      _$CategoriesScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$CategoriesScreenStateErrorCopyWithImpl<$Res>
    extends _$CategoriesScreenStateCopyWithImpl<$Res>
    implements $CategoriesScreenStateErrorCopyWith<$Res> {
  _$CategoriesScreenStateErrorCopyWithImpl(CategoriesScreenStateError _value,
      $Res Function(CategoriesScreenStateError) _then)
      : super(_value, (v) => _then(v as CategoriesScreenStateError));

  @override
  CategoriesScreenStateError get _value =>
      super._value as CategoriesScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(CategoriesScreenStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoriesScreenStateError implements CategoriesScreenStateError {
  const _$CategoriesScreenStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CategoriesScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $CategoriesScreenStateErrorCopyWith<CategoriesScreenStateError>
      get copyWith =>
          _$CategoriesScreenStateErrorCopyWithImpl<CategoriesScreenStateError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, List<CategoryDTO>> categories,
            int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<int, List<CategoryDTO>> categories, int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, List<CategoryDTO>> categories, int currentPage,
            int totalCount)?
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
    required TResult Function(CategoriesScreenStateReady value) ready,
    required TResult Function(CategoriesScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoriesScreenStateReady value)? ready,
    TResult Function(CategoriesScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesScreenStateReady value)? ready,
    TResult Function(CategoriesScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoriesScreenStateError implements CategoriesScreenState {
  const factory CategoriesScreenStateError({required String error}) =
      _$CategoriesScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  $CategoriesScreenStateErrorCopyWith<CategoriesScreenStateError>
      get copyWith => throw _privateConstructorUsedError;
}
