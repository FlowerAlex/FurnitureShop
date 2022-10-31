// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'products_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenStateReady value) ready,
    required TResult Function(ProductsScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenStateReady value)? ready,
    TResult Function(ProductsScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenStateReady value)? ready,
    TResult Function(ProductsScreenStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsScreenStateCopyWith<$Res> {
  factory $ProductsScreenStateCopyWith(
          ProductsScreenState value, $Res Function(ProductsScreenState) then) =
      _$ProductsScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductsScreenStateCopyWithImpl<$Res>
    implements $ProductsScreenStateCopyWith<$Res> {
  _$ProductsScreenStateCopyWithImpl(this._value, this._then);

  final ProductsScreenState _value;
  // ignore: unused_field
  final $Res Function(ProductsScreenState) _then;
}

/// @nodoc
abstract class _$$ProductsScreenStateReadyCopyWith<$Res> {
  factory _$$ProductsScreenStateReadyCopyWith(_$ProductsScreenStateReady value,
          $Res Function(_$ProductsScreenStateReady) then) =
      __$$ProductsScreenStateReadyCopyWithImpl<$Res>;
  $Res call(
      {Map<int, List<ProductDTO>> products,
      ProductDetailsDTO? currentProduct,
      int currentPage,
      int totalCount});
}

/// @nodoc
class __$$ProductsScreenStateReadyCopyWithImpl<$Res>
    extends _$ProductsScreenStateCopyWithImpl<$Res>
    implements _$$ProductsScreenStateReadyCopyWith<$Res> {
  __$$ProductsScreenStateReadyCopyWithImpl(_$ProductsScreenStateReady _value,
      $Res Function(_$ProductsScreenStateReady) _then)
      : super(_value, (v) => _then(v as _$ProductsScreenStateReady));

  @override
  _$ProductsScreenStateReady get _value =>
      super._value as _$ProductsScreenStateReady;

  @override
  $Res call({
    Object? products = freezed,
    Object? currentProduct = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$ProductsScreenStateReady(
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<int, List<ProductDTO>>,
      currentProduct: currentProduct == freezed
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as ProductDetailsDTO?,
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

class _$ProductsScreenStateReady implements ProductsScreenStateReady {
  const _$ProductsScreenStateReady(
      {final Map<int, List<ProductDTO>> products =
          const <int, List<ProductDTO>>{},
      this.currentProduct,
      this.currentPage = 0,
      this.totalCount = 0})
      : _products = products;

  final Map<int, List<ProductDTO>> _products;
  @override
  @JsonKey()
  Map<int, List<ProductDTO>> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_products);
  }

  @override
  final ProductDetailsDTO? currentProduct;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'ProductsScreenState.ready(products: $products, currentProduct: $currentProduct, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsScreenStateReady &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.currentProduct, currentProduct) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(currentProduct),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$ProductsScreenStateReadyCopyWith<_$ProductsScreenStateReady>
      get copyWith =>
          __$$ProductsScreenStateReadyCopyWithImpl<_$ProductsScreenStateReady>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(products, currentProduct, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(products, currentProduct, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(products, currentProduct, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenStateReady value) ready,
    required TResult Function(ProductsScreenStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenStateReady value)? ready,
    TResult Function(ProductsScreenStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenStateReady value)? ready,
    TResult Function(ProductsScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ProductsScreenStateReady implements ProductsScreenState {
  const factory ProductsScreenStateReady(
      {final Map<int, List<ProductDTO>> products,
      final ProductDetailsDTO? currentProduct,
      final int currentPage,
      final int totalCount}) = _$ProductsScreenStateReady;

  Map<int, List<ProductDTO>> get products;
  ProductDetailsDTO? get currentProduct;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$ProductsScreenStateReadyCopyWith<_$ProductsScreenStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsScreenStateErrorCopyWith<$Res> {
  factory _$$ProductsScreenStateErrorCopyWith(_$ProductsScreenStateError value,
          $Res Function(_$ProductsScreenStateError) then) =
      __$$ProductsScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$ProductsScreenStateErrorCopyWithImpl<$Res>
    extends _$ProductsScreenStateCopyWithImpl<$Res>
    implements _$$ProductsScreenStateErrorCopyWith<$Res> {
  __$$ProductsScreenStateErrorCopyWithImpl(_$ProductsScreenStateError _value,
      $Res Function(_$ProductsScreenStateError) _then)
      : super(_value, (v) => _then(v as _$ProductsScreenStateError));

  @override
  _$ProductsScreenStateError get _value =>
      super._value as _$ProductsScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ProductsScreenStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductsScreenStateError implements ProductsScreenStateError {
  const _$ProductsScreenStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProductsScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ProductsScreenStateErrorCopyWith<_$ProductsScreenStateError>
      get copyWith =>
          __$$ProductsScreenStateErrorCopyWithImpl<_$ProductsScreenStateError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, List<ProductDTO>> products,
            ProductDetailsDTO? currentProduct, int currentPage, int totalCount)?
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
    required TResult Function(ProductsScreenStateReady value) ready,
    required TResult Function(ProductsScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenStateReady value)? ready,
    TResult Function(ProductsScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenStateReady value)? ready,
    TResult Function(ProductsScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductsScreenStateError implements ProductsScreenState {
  const factory ProductsScreenStateError({required final String error}) =
      _$ProductsScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ProductsScreenStateErrorCopyWith<_$ProductsScreenStateError>
      get copyWith => throw _privateConstructorUsedError;
}
