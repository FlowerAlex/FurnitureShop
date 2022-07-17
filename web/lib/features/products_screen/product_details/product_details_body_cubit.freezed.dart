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

  ProductDetailsBodyStateReady ready(
      {List<CategoryDTO> categories = const <CategoryDTO>[],
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel}) {
    return ProductDetailsBodyStateReady(
      categories: categories,
      name: name,
      price: price,
      description: description,
      selectedCategoryId: selectedCategoryId,
      currentImage: currentImage,
      currentModel: currentModel,
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
    Object? categories = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? selectedCategoryId = freezed,
    Object? currentImage = freezed,
    Object? currentModel = freezed,
  }) {
    return _then(ProductDetailsBodyStateReady(
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

class _$ProductDetailsBodyStateReady implements ProductDetailsBodyStateReady {
  const _$ProductDetailsBodyStateReady(
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
    return 'ProductDetailsBodyState.ready(categories: $categories, name: $name, price: $price, description: $description, selectedCategoryId: $selectedCategoryId, currentImage: $currentImage, currentModel: $currentModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsBodyStateReady &&
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
  $ProductDetailsBodyStateReadyCopyWith<ProductDetailsBodyStateReady>
      get copyWith => _$ProductDetailsBodyStateReadyCopyWithImpl<
          ProductDetailsBodyStateReady>(this, _$identity);

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
  const factory ProductDetailsBodyStateReady(
      {List<CategoryDTO> categories,
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel}) = _$ProductDetailsBodyStateReady;

  List<CategoryDTO> get categories;
  String? get name;
  String? get price;
  String? get description;
  String? get selectedCategoryId;
  PlatformFile? get currentImage;
  PlatformFile? get currentModel;
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
