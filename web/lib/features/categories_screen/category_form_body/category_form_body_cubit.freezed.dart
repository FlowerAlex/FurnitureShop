// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_form_body_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryFormBodyStateTearOff {
  const _$CategoryFormBodyStateTearOff();

  CategoryFormBodyStateReady ready(
      {List<CategoryDTO> categories = const <CategoryDTO>[],
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel}) {
    return CategoryFormBodyStateReady(
      categories: categories,
      name: name,
      price: price,
      description: description,
      selectedCategoryId: selectedCategoryId,
      currentImage: currentImage,
      currentModel: currentModel,
    );
  }

  CategoryFormBodyStateError error({required String error}) {
    return CategoryFormBodyStateError(
      error: error,
    );
  }
}

/// @nodoc
const $CategoryFormBodyState = _$CategoryFormBodyStateTearOff();

/// @nodoc
mixin _$CategoryFormBodyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFormBodyStateReady value) ready,
    required TResult Function(CategoryFormBodyStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
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
abstract class $CategoryFormBodyStateReadyCopyWith<$Res> {
  factory $CategoryFormBodyStateReadyCopyWith(CategoryFormBodyStateReady value,
          $Res Function(CategoryFormBodyStateReady) then) =
      _$CategoryFormBodyStateReadyCopyWithImpl<$Res>;
  $Res call(
      {List<CategoryDTO> categories,
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel});
}

/// @nodoc
class _$CategoryFormBodyStateReadyCopyWithImpl<$Res>
    extends _$CategoryFormBodyStateCopyWithImpl<$Res>
    implements $CategoryFormBodyStateReadyCopyWith<$Res> {
  _$CategoryFormBodyStateReadyCopyWithImpl(CategoryFormBodyStateReady _value,
      $Res Function(CategoryFormBodyStateReady) _then)
      : super(_value, (v) => _then(v as CategoryFormBodyStateReady));

  @override
  CategoryFormBodyStateReady get _value =>
      super._value as CategoryFormBodyStateReady;

  @override
  $Res call({
    Object? categories = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? selectedCategoryId = freezed,
    Object? currentImage = freezed,
    Object? currentModel = freezed,
  }) {
    return _then(CategoryFormBodyStateReady(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategoryId: selectedCategoryId == freezed
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentImage: currentImage == freezed
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      currentModel: currentModel == freezed
          ? _value.currentModel
          : currentModel // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
    ));
  }
}

/// @nodoc

class _$CategoryFormBodyStateReady implements CategoryFormBodyStateReady {
  const _$CategoryFormBodyStateReady(
      {this.categories = const <CategoryDTO>[],
      this.name,
      this.price,
      this.description,
      this.selectedCategoryId,
      this.currentImage,
      this.currentModel});

  @JsonKey()
  @override
  final List<CategoryDTO> categories;
  @override
  final String? name;
  @override
  final String? price;
  @override
  final String? description;
  @override
  final String? selectedCategoryId;
  @override
  final PlatformFile? currentImage;
  @override
  final PlatformFile? currentModel;

  @override
  String toString() {
    return 'CategoryFormBodyState.ready(categories: $categories, name: $name, price: $price, description: $description, selectedCategoryId: $selectedCategoryId, currentImage: $currentImage, currentModel: $currentModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryFormBodyStateReady &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategoryId, selectedCategoryId) &&
            const DeepCollectionEquality()
                .equals(other.currentImage, currentImage) &&
            const DeepCollectionEquality()
                .equals(other.currentModel, currentModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(selectedCategoryId),
      const DeepCollectionEquality().hash(currentImage),
      const DeepCollectionEquality().hash(currentModel));

  @JsonKey(ignore: true)
  @override
  $CategoryFormBodyStateReadyCopyWith<CategoryFormBodyStateReady>
      get copyWith =>
          _$CategoryFormBodyStateReadyCopyWithImpl<CategoryFormBodyStateReady>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(categories, name, price, description, selectedCategoryId,
        currentImage, currentModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(categories, name, price, description, selectedCategoryId,
        currentImage, currentModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(categories, name, price, description, selectedCategoryId,
          currentImage, currentModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFormBodyStateReady value) ready,
    required TResult Function(CategoryFormBodyStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
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
      {List<CategoryDTO> categories,
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel}) = _$CategoryFormBodyStateReady;

  List<CategoryDTO> get categories;
  String? get name;
  String? get price;
  String? get description;
  String? get selectedCategoryId;
  PlatformFile? get currentImage;
  PlatformFile? get currentModel;
  @JsonKey(ignore: true)
  $CategoryFormBodyStateReadyCopyWith<CategoryFormBodyStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFormBodyStateErrorCopyWith<$Res> {
  factory $CategoryFormBodyStateErrorCopyWith(CategoryFormBodyStateError value,
          $Res Function(CategoryFormBodyStateError) then) =
      _$CategoryFormBodyStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$CategoryFormBodyStateErrorCopyWithImpl<$Res>
    extends _$CategoryFormBodyStateCopyWithImpl<$Res>
    implements $CategoryFormBodyStateErrorCopyWith<$Res> {
  _$CategoryFormBodyStateErrorCopyWithImpl(CategoryFormBodyStateError _value,
      $Res Function(CategoryFormBodyStateError) _then)
      : super(_value, (v) => _then(v as CategoryFormBodyStateError));

  @override
  CategoryFormBodyStateError get _value =>
      super._value as CategoryFormBodyStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(CategoryFormBodyStateError(
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
            other is CategoryFormBodyStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $CategoryFormBodyStateErrorCopyWith<CategoryFormBodyStateError>
      get copyWith =>
          _$CategoryFormBodyStateErrorCopyWithImpl<CategoryFormBodyStateError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            String? name,
            String? price,
            String? description,
            String? selectedCategoryId,
            PlatformFile? currentImage,
            PlatformFile? currentModel)?
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
    required TResult Function(CategoryFormBodyStateReady value) ready,
    required TResult Function(CategoryFormBodyStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
    TResult Function(CategoryFormBodyStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormBodyStateReady value)? ready,
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
  const factory CategoryFormBodyStateError({required String error}) =
      _$CategoryFormBodyStateError;

  String get error;
  @JsonKey(ignore: true)
  $CategoryFormBodyStateErrorCopyWith<CategoryFormBodyStateError>
      get copyWith => throw _privateConstructorUsedError;
}
