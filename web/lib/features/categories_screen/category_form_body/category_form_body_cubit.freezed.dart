// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_form_body_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryFormBodyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)
        ready,
    required TResult Function() finished,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFormBodyStateReady value) ready,
    required TResult Function(CategoryFormBodyStateFinished value) finished,
    required TResult Function(CategoryFormBodyStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFormBodyStateCopyWith<$Res> {
  factory $CategoryFormBodyStateCopyWith(CategoryFormBodyState value,
          $Res Function(CategoryFormBodyState) then) =
      _$CategoryFormBodyStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryFormBodyStateCopyWithImpl<$Res>
    implements $CategoryFormBodyStateCopyWith<$Res> {
  _$CategoryFormBodyStateCopyWithImpl(this._value, this._then);

  final CategoryFormBodyState _value;
  // ignore: unused_field
  final $Res Function(CategoryFormBodyState) _then;
}

/// @nodoc
abstract class _$$CategoryFormBodyStateReadyCopyWith<$Res> {
  factory _$$CategoryFormBodyStateReadyCopyWith(
          _$CategoryFormBodyStateReady value,
          $Res Function(_$CategoryFormBodyStateReady) then) =
      __$$CategoryFormBodyStateReadyCopyWithImpl<$Res>;
  $Res call({List<CategoryDTO> categories, String name, String? categoryId});
}

/// @nodoc
class __$$CategoryFormBodyStateReadyCopyWithImpl<$Res>
    extends _$CategoryFormBodyStateCopyWithImpl<$Res>
    implements _$$CategoryFormBodyStateReadyCopyWith<$Res> {
  __$$CategoryFormBodyStateReadyCopyWithImpl(
      _$CategoryFormBodyStateReady _value,
      $Res Function(_$CategoryFormBodyStateReady) _then)
      : super(_value, (v) => _then(v as _$CategoryFormBodyStateReady));

  @override
  _$CategoryFormBodyStateReady get _value =>
      super._value as _$CategoryFormBodyStateReady;

  @override
  $Res call({
    Object? categories = freezed,
    Object? name = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$CategoryFormBodyStateReady(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CategoryFormBodyStateReady implements CategoryFormBodyStateReady {
  const _$CategoryFormBodyStateReady(
      {final List<CategoryDTO> categories = const <CategoryDTO>[],
      this.name = '',
      this.categoryId})
      : _categories = categories;

  final List<CategoryDTO> _categories;
  @override
  @JsonKey()
  List<CategoryDTO> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final String name;
  @override
  final String? categoryId;

  @override
  String toString() {
    return 'CategoryFormBodyState.ready(categories: $categories, name: $name, categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryFormBodyStateReady &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(categoryId));

  @JsonKey(ignore: true)
  @override
  _$$CategoryFormBodyStateReadyCopyWith<_$CategoryFormBodyStateReady>
      get copyWith => __$$CategoryFormBodyStateReadyCopyWithImpl<
          _$CategoryFormBodyStateReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)
        ready,
    required TResult Function() finished,
    required TResult Function(String error) error,
  }) {
    return ready(categories, name, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
    TResult Function(String error)? error,
  }) {
    return ready?.call(categories, name, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(categories, name, categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFormBodyStateReady value) ready,
    required TResult Function(CategoryFormBodyStateFinished value) finished,
    required TResult Function(CategoryFormBodyStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class CategoryFormBodyStateReady implements CategoryFormBodyState {
  const factory CategoryFormBodyStateReady(
      {final List<CategoryDTO> categories,
      final String name,
      final String? categoryId}) = _$CategoryFormBodyStateReady;

  List<CategoryDTO> get categories;
  String get name;
  String? get categoryId;
  @JsonKey(ignore: true)
  _$$CategoryFormBodyStateReadyCopyWith<_$CategoryFormBodyStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryFormBodyStateFinishedCopyWith<$Res> {
  factory _$$CategoryFormBodyStateFinishedCopyWith(
          _$CategoryFormBodyStateFinished value,
          $Res Function(_$CategoryFormBodyStateFinished) then) =
      __$$CategoryFormBodyStateFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryFormBodyStateFinishedCopyWithImpl<$Res>
    extends _$CategoryFormBodyStateCopyWithImpl<$Res>
    implements _$$CategoryFormBodyStateFinishedCopyWith<$Res> {
  __$$CategoryFormBodyStateFinishedCopyWithImpl(
      _$CategoryFormBodyStateFinished _value,
      $Res Function(_$CategoryFormBodyStateFinished) _then)
      : super(_value, (v) => _then(v as _$CategoryFormBodyStateFinished));

  @override
  _$CategoryFormBodyStateFinished get _value =>
      super._value as _$CategoryFormBodyStateFinished;
}

/// @nodoc

class _$CategoryFormBodyStateFinished implements CategoryFormBodyStateFinished {
  const _$CategoryFormBodyStateFinished();

  @override
  String toString() {
    return 'CategoryFormBodyState.finished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryFormBodyStateFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)
        ready,
    required TResult Function() finished,
    required TResult Function(String error) error,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
    TResult Function(String error)? error,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFormBodyStateReady value) ready,
    required TResult Function(CategoryFormBodyStateFinished value) finished,
    required TResult Function(CategoryFormBodyStateError value) error,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class CategoryFormBodyStateFinished implements CategoryFormBodyState {
  const factory CategoryFormBodyStateFinished() =
      _$CategoryFormBodyStateFinished;
}

/// @nodoc
abstract class _$$CategoryFormBodyStateErrorCopyWith<$Res> {
  factory _$$CategoryFormBodyStateErrorCopyWith(
          _$CategoryFormBodyStateError value,
          $Res Function(_$CategoryFormBodyStateError) then) =
      __$$CategoryFormBodyStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$CategoryFormBodyStateErrorCopyWithImpl<$Res>
    extends _$CategoryFormBodyStateCopyWithImpl<$Res>
    implements _$$CategoryFormBodyStateErrorCopyWith<$Res> {
  __$$CategoryFormBodyStateErrorCopyWithImpl(
      _$CategoryFormBodyStateError _value,
      $Res Function(_$CategoryFormBodyStateError) _then)
      : super(_value, (v) => _then(v as _$CategoryFormBodyStateError));

  @override
  _$CategoryFormBodyStateError get _value =>
      super._value as _$CategoryFormBodyStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$CategoryFormBodyStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryFormBodyStateError implements CategoryFormBodyStateError {
  const _$CategoryFormBodyStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CategoryFormBodyState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryFormBodyStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$CategoryFormBodyStateErrorCopyWith<_$CategoryFormBodyStateError>
      get copyWith => __$$CategoryFormBodyStateErrorCopyWithImpl<
          _$CategoryFormBodyStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)
        ready,
    required TResult Function() finished,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories, String name, String? categoryId)?
        ready,
    TResult Function()? finished,
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
    required TResult Function(CategoryFormBodyStateReady value) ready,
    required TResult Function(CategoryFormBodyStateFinished value) finished,
    required TResult Function(CategoryFormBodyStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateFinished value)? finished,
    TResult Function(CategoryFormBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoryFormBodyStateError implements CategoryFormBodyState {
  const factory CategoryFormBodyStateError({required final String error}) =
      _$CategoryFormBodyStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$CategoryFormBodyStateErrorCopyWith<_$CategoryFormBodyStateError>
      get copyWith => throw _privateConstructorUsedError;
}
