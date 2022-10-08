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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductFormBodyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductDetailsDTO? editingProduct,
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
            ProductDetailsDTO? editingProduct,
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
            ProductDetailsDTO? editingProduct,
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
abstract class _$$ProductFormBodyStateReadyCopyWith<$Res> {
  factory _$$ProductFormBodyStateReadyCopyWith(
          _$ProductFormBodyStateReady value,
          $Res Function(_$ProductFormBodyStateReady) then) =
      __$$ProductFormBodyStateReadyCopyWithImpl<$Res>;
  $Res call(
      {ProductDetailsDTO? editingProduct,
      List<CategoryDTO> categories,
      String? name,
      String? price,
      String? description,
      String? selectedCategoryId,
      PlatformFile? currentImage,
      PlatformFile? currentModel});
}

/// @nodoc
class __$$ProductFormBodyStateReadyCopyWithImpl<$Res>
    extends _$ProductFormBodyStateCopyWithImpl<$Res>
    implements _$$ProductFormBodyStateReadyCopyWith<$Res> {
  __$$ProductFormBodyStateReadyCopyWithImpl(_$ProductFormBodyStateReady _value,
      $Res Function(_$ProductFormBodyStateReady) _then)
      : super(_value, (v) => _then(v as _$ProductFormBodyStateReady));

  @override
  _$ProductFormBodyStateReady get _value =>
      super._value as _$ProductFormBodyStateReady;

  @override
  $Res call({
    Object? editingProduct = freezed,
    Object? categories = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? selectedCategoryId = freezed,
    Object? currentImage = freezed,
    Object? currentModel = freezed,
  }) {
    return _then(_$ProductFormBodyStateReady(
      editingProduct: editingProduct == freezed
          ? _value.editingProduct
          : editingProduct // ignore: cast_nullable_to_non_nullable
              as ProductDetailsDTO?,
      categories: categories == freezed
          ? _value._categories
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
      {this.editingProduct,
      final List<CategoryDTO> categories = const <CategoryDTO>[],
      this.name,
      this.price,
      this.description,
      this.selectedCategoryId,
      this.currentImage,
      this.currentModel})
      : _categories = categories;

  @override
  final ProductDetailsDTO? editingProduct;
  final List<CategoryDTO> _categories;
  @override
  @JsonKey()
  List<CategoryDTO> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

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
    return 'ProductFormBodyState.ready(editingProduct: $editingProduct, categories: $categories, name: $name, price: $price, description: $description, selectedCategoryId: $selectedCategoryId, currentImage: $currentImage, currentModel: $currentModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFormBodyStateReady &&
            const DeepCollectionEquality()
                .equals(other.editingProduct, editingProduct) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
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
      const DeepCollectionEquality().hash(editingProduct),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(selectedCategoryId),
      const DeepCollectionEquality().hash(currentImage),
      const DeepCollectionEquality().hash(currentModel));

  @JsonKey(ignore: true)
  @override
  _$$ProductFormBodyStateReadyCopyWith<_$ProductFormBodyStateReady>
      get copyWith => __$$ProductFormBodyStateReadyCopyWithImpl<
          _$ProductFormBodyStateReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductDetailsDTO? editingProduct,
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
    return ready(editingProduct, categories, name, price, description,
        selectedCategoryId, currentImage, currentModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            ProductDetailsDTO? editingProduct,
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
    return ready?.call(editingProduct, categories, name, price, description,
        selectedCategoryId, currentImage, currentModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProductDetailsDTO? editingProduct,
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
      return ready(editingProduct, categories, name, price, description,
          selectedCategoryId, currentImage, currentModel);
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
      {final ProductDetailsDTO? editingProduct,
      final List<CategoryDTO> categories,
      final String? name,
      final String? price,
      final String? description,
      final String? selectedCategoryId,
      final PlatformFile? currentImage,
      final PlatformFile? currentModel}) = _$ProductFormBodyStateReady;

  ProductDetailsDTO? get editingProduct;
  List<CategoryDTO> get categories;
  String? get name;
  String? get price;
  String? get description;
  String? get selectedCategoryId;
  PlatformFile? get currentImage;
  PlatformFile? get currentModel;
  @JsonKey(ignore: true)
  _$$ProductFormBodyStateReadyCopyWith<_$ProductFormBodyStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductFormBodyStateFinishedCopyWith<$Res> {
  factory _$$ProductFormBodyStateFinishedCopyWith(
          _$ProductFormBodyStateFinished value,
          $Res Function(_$ProductFormBodyStateFinished) then) =
      __$$ProductFormBodyStateFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductFormBodyStateFinishedCopyWithImpl<$Res>
    extends _$ProductFormBodyStateCopyWithImpl<$Res>
    implements _$$ProductFormBodyStateFinishedCopyWith<$Res> {
  __$$ProductFormBodyStateFinishedCopyWithImpl(
      _$ProductFormBodyStateFinished _value,
      $Res Function(_$ProductFormBodyStateFinished) _then)
      : super(_value, (v) => _then(v as _$ProductFormBodyStateFinished));

  @override
  _$ProductFormBodyStateFinished get _value =>
      super._value as _$ProductFormBodyStateFinished;
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
            other is _$ProductFormBodyStateFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductDetailsDTO? editingProduct,
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
            ProductDetailsDTO? editingProduct,
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
            ProductDetailsDTO? editingProduct,
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
abstract class _$$ProductFormBodyStateErrorCopyWith<$Res> {
  factory _$$ProductFormBodyStateErrorCopyWith(
          _$ProductFormBodyStateError value,
          $Res Function(_$ProductFormBodyStateError) then) =
      __$$ProductFormBodyStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$ProductFormBodyStateErrorCopyWithImpl<$Res>
    extends _$ProductFormBodyStateCopyWithImpl<$Res>
    implements _$$ProductFormBodyStateErrorCopyWith<$Res> {
  __$$ProductFormBodyStateErrorCopyWithImpl(_$ProductFormBodyStateError _value,
      $Res Function(_$ProductFormBodyStateError) _then)
      : super(_value, (v) => _then(v as _$ProductFormBodyStateError));

  @override
  _$ProductFormBodyStateError get _value =>
      super._value as _$ProductFormBodyStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ProductFormBodyStateError(
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
            other is _$ProductFormBodyStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ProductFormBodyStateErrorCopyWith<_$ProductFormBodyStateError>
      get copyWith => __$$ProductFormBodyStateErrorCopyWithImpl<
          _$ProductFormBodyStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductDetailsDTO? editingProduct,
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
            ProductDetailsDTO? editingProduct,
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
            ProductDetailsDTO? editingProduct,
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
  const factory ProductFormBodyStateError({required final String error}) =
      _$ProductFormBodyStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ProductFormBodyStateErrorCopyWith<_$ProductFormBodyStateError>
      get copyWith => throw _privateConstructorUsedError;
}
