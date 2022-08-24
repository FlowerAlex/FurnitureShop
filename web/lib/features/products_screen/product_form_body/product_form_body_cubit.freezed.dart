// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_form_body_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductFormBodyStateTearOff {
  const _$ProductFormBodyStateTearOff();

  ProductFormBodyStateReady ready(
      {List<CategoryDTO> categories = const <CategoryDTO>[],
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel}) {
    return ProductFormBodyStateReady(
      categories: categories,
      name: name,
      price: price,
      description: description,
      selectedCategoryId: selectedCategoryId,
      currentImage: currentImage,
      currentModel: currentModel,
    );
  }

  ProductFormBodyStateFinished finished() {
    return const ProductFormBodyStateFinished();
  }

  ProductFormBodyStateError error({required String error}) {
    return ProductFormBodyStateError(
      error: error,
    );
  }
}

/// @nodoc
const $ProductFormBodyState = _$ProductFormBodyStateTearOff();

/// @nodoc
mixin _$ProductFormBodyState {
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
    required TResult Function() finished,
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
    TResult Function()? finished,
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
    TResult Function()? finished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductFormBodyStateReady value) ready,
    required TResult Function(ProductFormBodyStateFinished value) finished,
    required TResult Function(ProductFormBodyStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFormBodyStateCopyWith<$Res> {
  factory $ProductFormBodyStateCopyWith(ProductFormBodyState value,
          $Res Function(ProductFormBodyState) then) =
      _$ProductFormBodyStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductFormBodyStateCopyWithImpl<$Res>
    implements $ProductFormBodyStateCopyWith<$Res> {
  _$ProductFormBodyStateCopyWithImpl(this._value, this._then);

  final ProductFormBodyState _value;
  // ignore: unused_field
  final $Res Function(ProductFormBodyState) _then;
}

/// @nodoc
abstract class $ProductFormBodyStateReadyCopyWith<$Res> {
  factory $ProductFormBodyStateReadyCopyWith(ProductFormBodyStateReady value,
          $Res Function(ProductFormBodyStateReady) then) =
      _$ProductFormBodyStateReadyCopyWithImpl<$Res>;
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
class _$ProductFormBodyStateReadyCopyWithImpl<$Res>
    extends _$ProductFormBodyStateCopyWithImpl<$Res>
    implements $ProductFormBodyStateReadyCopyWith<$Res> {
  _$ProductFormBodyStateReadyCopyWithImpl(ProductFormBodyStateReady _value,
      $Res Function(ProductFormBodyStateReady) _then)
      : super(_value, (v) => _then(v as ProductFormBodyStateReady));

  @override
  ProductFormBodyStateReady get _value =>
      super._value as ProductFormBodyStateReady;

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
    return _then(ProductFormBodyStateReady(
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

class _$ProductFormBodyStateReady implements ProductFormBodyStateReady {
  const _$ProductFormBodyStateReady(
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
    return 'ProductFormBodyState.ready(categories: $categories, name: $name, price: $price, description: $description, selectedCategoryId: $selectedCategoryId, currentImage: $currentImage, currentModel: $currentModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductFormBodyStateReady &&
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
  $ProductFormBodyStateReadyCopyWith<ProductFormBodyStateReady> get copyWith =>
      _$ProductFormBodyStateReadyCopyWithImpl<ProductFormBodyStateReady>(
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
    required TResult Function() finished,
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
    TResult Function()? finished,
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
    TResult Function()? finished,
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
    required TResult Function(ProductFormBodyStateReady value) ready,
    required TResult Function(ProductFormBodyStateFinished value) finished,
    required TResult Function(ProductFormBodyStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ProductFormBodyStateReady implements ProductFormBodyState {
  const factory ProductFormBodyStateReady(
      {List<CategoryDTO> categories,
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel}) = _$ProductFormBodyStateReady;

  List<CategoryDTO> get categories;
  String? get name;
  String? get price;
  String? get description;
  String? get selectedCategoryId;
  PlatformFile? get currentImage;
  PlatformFile? get currentModel;
  @JsonKey(ignore: true)
  $ProductFormBodyStateReadyCopyWith<ProductFormBodyStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFormBodyStateFinishedCopyWith<$Res> {
  factory $ProductFormBodyStateFinishedCopyWith(
          ProductFormBodyStateFinished value,
          $Res Function(ProductFormBodyStateFinished) then) =
      _$ProductFormBodyStateFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductFormBodyStateFinishedCopyWithImpl<$Res>
    extends _$ProductFormBodyStateCopyWithImpl<$Res>
    implements $ProductFormBodyStateFinishedCopyWith<$Res> {
  _$ProductFormBodyStateFinishedCopyWithImpl(
      ProductFormBodyStateFinished _value,
      $Res Function(ProductFormBodyStateFinished) _then)
      : super(_value, (v) => _then(v as ProductFormBodyStateFinished));

  @override
  ProductFormBodyStateFinished get _value =>
      super._value as ProductFormBodyStateFinished;
}

/// @nodoc

class _$ProductFormBodyStateFinished implements ProductFormBodyStateFinished {
  const _$ProductFormBodyStateFinished();

  @override
  String toString() {
    return 'ProductFormBodyState.finished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductFormBodyStateFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

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
    required TResult Function() finished,
    required TResult Function(String error) error,
  }) {
    return finished();
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
    TResult Function()? finished,
    TResult Function(String error)? error,
  }) {
    return finished?.call();
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
    required TResult Function(ProductFormBodyStateReady value) ready,
    required TResult Function(ProductFormBodyStateFinished value) finished,
    required TResult Function(ProductFormBodyStateError value) error,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class ProductFormBodyStateFinished implements ProductFormBodyState {
  const factory ProductFormBodyStateFinished() = _$ProductFormBodyStateFinished;
}

/// @nodoc
abstract class $ProductFormBodyStateErrorCopyWith<$Res> {
  factory $ProductFormBodyStateErrorCopyWith(ProductFormBodyStateError value,
          $Res Function(ProductFormBodyStateError) then) =
      _$ProductFormBodyStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ProductFormBodyStateErrorCopyWithImpl<$Res>
    extends _$ProductFormBodyStateCopyWithImpl<$Res>
    implements $ProductFormBodyStateErrorCopyWith<$Res> {
  _$ProductFormBodyStateErrorCopyWithImpl(ProductFormBodyStateError _value,
      $Res Function(ProductFormBodyStateError) _then)
      : super(_value, (v) => _then(v as ProductFormBodyStateError));

  @override
  ProductFormBodyStateError get _value =>
      super._value as ProductFormBodyStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ProductFormBodyStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductFormBodyStateError implements ProductFormBodyStateError {
  const _$ProductFormBodyStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProductFormBodyState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductFormBodyStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ProductFormBodyStateErrorCopyWith<ProductFormBodyStateError> get copyWith =>
      _$ProductFormBodyStateErrorCopyWithImpl<ProductFormBodyStateError>(
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
    required TResult Function() finished,
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
    TResult Function()? finished,
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
    required TResult Function(ProductFormBodyStateReady value) ready,
    required TResult Function(ProductFormBodyStateFinished value) finished,
    required TResult Function(ProductFormBodyStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductFormBodyStateReady value)? ready,
    TResult Function(ProductFormBodyStateFinished value)? finished,
    TResult Function(ProductFormBodyStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductFormBodyStateError implements ProductFormBodyState {
  const factory ProductFormBodyStateError({required String error}) =
      _$ProductFormBodyStateError;

  String get error;
  @JsonKey(ignore: true)
  $ProductFormBodyStateErrorCopyWith<ProductFormBodyStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
