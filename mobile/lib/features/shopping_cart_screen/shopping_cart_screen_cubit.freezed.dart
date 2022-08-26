// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shopping_cart_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShoppingCartScreenStateTearOff {
  const _$ShoppingCartScreenStateTearOff();

  ShoppingCartScreenStateLoading loading() {
    return const ShoppingCartScreenStateLoading();
  }

  ShoppingCartScreenStateReady ready(
      {required List<SelectableShoppingCartProduct> shoppingCartProducts,
      required CategoryDTO activeCategory,
      List<bool> selectedProdcuts = const <bool>[],
      List<CategoryDTO> categories = const <CategoryDTO>[],
      int currentPage = 0,
      int totalCount = 0}) {
    return ShoppingCartScreenStateReady(
      shoppingCartProducts: shoppingCartProducts,
      activeCategory: activeCategory,
      selectedProdcuts: selectedProdcuts,
      categories: categories,
      currentPage: currentPage,
      totalCount: totalCount,
    );
  }

  ShoppingCartScreenStateError error({required String error}) {
    return ShoppingCartScreenStateError(
      error: error,
    );
  }
}

/// @nodoc
const $ShoppingCartScreenState = _$ShoppingCartScreenStateTearOff();

/// @nodoc
mixin _$ShoppingCartScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoppingCartScreenStateLoading value) loading,
    required TResult Function(ShoppingCartScreenStateReady value) ready,
    required TResult Function(ShoppingCartScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartScreenStateCopyWith<$Res> {
  factory $ShoppingCartScreenStateCopyWith(ShoppingCartScreenState value,
          $Res Function(ShoppingCartScreenState) then) =
      _$ShoppingCartScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartScreenStateCopyWith<$Res> {
  _$ShoppingCartScreenStateCopyWithImpl(this._value, this._then);

  final ShoppingCartScreenState _value;
  // ignore: unused_field
  final $Res Function(ShoppingCartScreenState) _then;
}

/// @nodoc
abstract class $ShoppingCartScreenStateLoadingCopyWith<$Res> {
  factory $ShoppingCartScreenStateLoadingCopyWith(
          ShoppingCartScreenStateLoading value,
          $Res Function(ShoppingCartScreenStateLoading) then) =
      _$ShoppingCartScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingCartScreenStateLoadingCopyWithImpl<$Res>
    extends _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartScreenStateLoadingCopyWith<$Res> {
  _$ShoppingCartScreenStateLoadingCopyWithImpl(
      ShoppingCartScreenStateLoading _value,
      $Res Function(ShoppingCartScreenStateLoading) _then)
      : super(_value, (v) => _then(v as ShoppingCartScreenStateLoading));

  @override
  ShoppingCartScreenStateLoading get _value =>
      super._value as ShoppingCartScreenStateLoading;
}

/// @nodoc

class _$ShoppingCartScreenStateLoading
    implements ShoppingCartScreenStateLoading {
  const _$ShoppingCartScreenStateLoading();

  @override
  String toString() {
    return 'ShoppingCartScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingCartScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoppingCartScreenStateLoading value) loading,
    required TResult Function(ShoppingCartScreenStateReady value) ready,
    required TResult Function(ShoppingCartScreenStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShoppingCartScreenStateLoading
    implements ShoppingCartScreenState {
  const factory ShoppingCartScreenStateLoading() =
      _$ShoppingCartScreenStateLoading;
}

/// @nodoc
abstract class $ShoppingCartScreenStateReadyCopyWith<$Res> {
  factory $ShoppingCartScreenStateReadyCopyWith(
          ShoppingCartScreenStateReady value,
          $Res Function(ShoppingCartScreenStateReady) then) =
      _$ShoppingCartScreenStateReadyCopyWithImpl<$Res>;
  $Res call(
      {List<SelectableShoppingCartProduct> shoppingCartProducts,
      CategoryDTO activeCategory,
      List<bool> selectedProdcuts,
      List<CategoryDTO> categories,
      int currentPage,
      int totalCount});
}

/// @nodoc
class _$ShoppingCartScreenStateReadyCopyWithImpl<$Res>
    extends _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartScreenStateReadyCopyWith<$Res> {
  _$ShoppingCartScreenStateReadyCopyWithImpl(
      ShoppingCartScreenStateReady _value,
      $Res Function(ShoppingCartScreenStateReady) _then)
      : super(_value, (v) => _then(v as ShoppingCartScreenStateReady));

  @override
  ShoppingCartScreenStateReady get _value =>
      super._value as ShoppingCartScreenStateReady;

  @override
  $Res call({
    Object? shoppingCartProducts = freezed,
    Object? activeCategory = freezed,
    Object? selectedProdcuts = freezed,
    Object? categories = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(ShoppingCartScreenStateReady(
      shoppingCartProducts: shoppingCartProducts == freezed
          ? _value.shoppingCartProducts
          : shoppingCartProducts // ignore: cast_nullable_to_non_nullable
              as List<SelectableShoppingCartProduct>,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
      selectedProdcuts: selectedProdcuts == freezed
          ? _value.selectedProdcuts
          : selectedProdcuts // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
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

class _$ShoppingCartScreenStateReady implements ShoppingCartScreenStateReady {
  const _$ShoppingCartScreenStateReady(
      {required this.shoppingCartProducts,
      required this.activeCategory,
      this.selectedProdcuts = const <bool>[],
      this.categories = const <CategoryDTO>[],
      this.currentPage = 0,
      this.totalCount = 0});

  @override
  final List<SelectableShoppingCartProduct> shoppingCartProducts;
  @override
  final CategoryDTO activeCategory;
  @JsonKey()
  @override
  final List<bool> selectedProdcuts;
  @JsonKey()
  @override
  final List<CategoryDTO> categories;
  @JsonKey()
  @override
  final int currentPage;
  @JsonKey()
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ShoppingCartScreenState.ready(shoppingCartProducts: $shoppingCartProducts, activeCategory: $activeCategory, selectedProdcuts: $selectedProdcuts, categories: $categories, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingCartScreenStateReady &&
            const DeepCollectionEquality()
                .equals(other.shoppingCartProducts, shoppingCartProducts) &&
            const DeepCollectionEquality()
                .equals(other.activeCategory, activeCategory) &&
            const DeepCollectionEquality()
                .equals(other.selectedProdcuts, selectedProdcuts) &&
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
      const DeepCollectionEquality().hash(shoppingCartProducts),
      const DeepCollectionEquality().hash(activeCategory),
      const DeepCollectionEquality().hash(selectedProdcuts),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  $ShoppingCartScreenStateReadyCopyWith<ShoppingCartScreenStateReady>
      get copyWith => _$ShoppingCartScreenStateReadyCopyWithImpl<
          ShoppingCartScreenStateReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(shoppingCartProducts, activeCategory, selectedProdcuts,
        categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(shoppingCartProducts, activeCategory, selectedProdcuts,
        categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(shoppingCartProducts, activeCategory, selectedProdcuts,
          categories, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoppingCartScreenStateLoading value) loading,
    required TResult Function(ShoppingCartScreenStateReady value) ready,
    required TResult Function(ShoppingCartScreenStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ShoppingCartScreenStateReady implements ShoppingCartScreenState {
  const factory ShoppingCartScreenStateReady(
      {required List<SelectableShoppingCartProduct> shoppingCartProducts,
      required CategoryDTO activeCategory,
      List<bool> selectedProdcuts,
      List<CategoryDTO> categories,
      int currentPage,
      int totalCount}) = _$ShoppingCartScreenStateReady;

  List<SelectableShoppingCartProduct> get shoppingCartProducts;
  CategoryDTO get activeCategory;
  List<bool> get selectedProdcuts;
  List<CategoryDTO> get categories;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  $ShoppingCartScreenStateReadyCopyWith<ShoppingCartScreenStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartScreenStateErrorCopyWith<$Res> {
  factory $ShoppingCartScreenStateErrorCopyWith(
          ShoppingCartScreenStateError value,
          $Res Function(ShoppingCartScreenStateError) then) =
      _$ShoppingCartScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ShoppingCartScreenStateErrorCopyWithImpl<$Res>
    extends _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartScreenStateErrorCopyWith<$Res> {
  _$ShoppingCartScreenStateErrorCopyWithImpl(
      ShoppingCartScreenStateError _value,
      $Res Function(ShoppingCartScreenStateError) _then)
      : super(_value, (v) => _then(v as ShoppingCartScreenStateError));

  @override
  ShoppingCartScreenStateError get _value =>
      super._value as ShoppingCartScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ShoppingCartScreenStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShoppingCartScreenStateError implements ShoppingCartScreenStateError {
  const _$ShoppingCartScreenStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ShoppingCartScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingCartScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ShoppingCartScreenStateErrorCopyWith<ShoppingCartScreenStateError>
      get copyWith => _$ShoppingCartScreenStateErrorCopyWithImpl<
          ShoppingCartScreenStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<SelectableShoppingCartProduct> shoppingCartProducts,
            CategoryDTO activeCategory,
            List<bool> selectedProdcuts,
            List<CategoryDTO> categories,
            int currentPage,
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
    required TResult Function(ShoppingCartScreenStateLoading value) loading,
    required TResult Function(ShoppingCartScreenStateReady value) ready,
    required TResult Function(ShoppingCartScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartScreenStateLoading value)? loading,
    TResult Function(ShoppingCartScreenStateReady value)? ready,
    TResult Function(ShoppingCartScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShoppingCartScreenStateError implements ShoppingCartScreenState {
  const factory ShoppingCartScreenStateError({required String error}) =
      _$ShoppingCartScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  $ShoppingCartScreenStateErrorCopyWith<ShoppingCartScreenStateError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$SelectableShoppingCartProductTearOff {
  const _$SelectableShoppingCartProductTearOff();

  _SelectableShoppingCartProduct call(
      {required ShoppingCartProductDTO product,
      required int count,
      required bool selected}) {
    return _SelectableShoppingCartProduct(
      product: product,
      count: count,
      selected: selected,
    );
  }
}

/// @nodoc
const $SelectableShoppingCartProduct = _$SelectableShoppingCartProductTearOff();

/// @nodoc
mixin _$SelectableShoppingCartProduct {
  ShoppingCartProductDTO get product => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectableShoppingCartProductCopyWith<SelectableShoppingCartProduct>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectableShoppingCartProductCopyWith<$Res> {
  factory $SelectableShoppingCartProductCopyWith(
          SelectableShoppingCartProduct value,
          $Res Function(SelectableShoppingCartProduct) then) =
      _$SelectableShoppingCartProductCopyWithImpl<$Res>;
  $Res call({ShoppingCartProductDTO product, int count, bool selected});
}

/// @nodoc
class _$SelectableShoppingCartProductCopyWithImpl<$Res>
    implements $SelectableShoppingCartProductCopyWith<$Res> {
  _$SelectableShoppingCartProductCopyWithImpl(this._value, this._then);

  final SelectableShoppingCartProduct _value;
  // ignore: unused_field
  final $Res Function(SelectableShoppingCartProduct) _then;

  @override
  $Res call({
    Object? product = freezed,
    Object? count = freezed,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ShoppingCartProductDTO,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SelectableShoppingCartProductCopyWith<$Res>
    implements $SelectableShoppingCartProductCopyWith<$Res> {
  factory _$SelectableShoppingCartProductCopyWith(
          _SelectableShoppingCartProduct value,
          $Res Function(_SelectableShoppingCartProduct) then) =
      __$SelectableShoppingCartProductCopyWithImpl<$Res>;
  @override
  $Res call({ShoppingCartProductDTO product, int count, bool selected});
}

/// @nodoc
class __$SelectableShoppingCartProductCopyWithImpl<$Res>
    extends _$SelectableShoppingCartProductCopyWithImpl<$Res>
    implements _$SelectableShoppingCartProductCopyWith<$Res> {
  __$SelectableShoppingCartProductCopyWithImpl(
      _SelectableShoppingCartProduct _value,
      $Res Function(_SelectableShoppingCartProduct) _then)
      : super(_value, (v) => _then(v as _SelectableShoppingCartProduct));

  @override
  _SelectableShoppingCartProduct get _value =>
      super._value as _SelectableShoppingCartProduct;

  @override
  $Res call({
    Object? product = freezed,
    Object? count = freezed,
    Object? selected = freezed,
  }) {
    return _then(_SelectableShoppingCartProduct(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ShoppingCartProductDTO,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SelectableShoppingCartProduct
    implements _SelectableShoppingCartProduct {
  const _$_SelectableShoppingCartProduct(
      {required this.product, required this.count, required this.selected});

  @override
  final ShoppingCartProductDTO product;
  @override
  final int count;
  @override
  final bool selected;

  @override
  String toString() {
    return 'SelectableShoppingCartProduct(product: $product, count: $count, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectableShoppingCartProduct &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.selected, selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(selected));

  @JsonKey(ignore: true)
  @override
  _$SelectableShoppingCartProductCopyWith<_SelectableShoppingCartProduct>
      get copyWith => __$SelectableShoppingCartProductCopyWithImpl<
          _SelectableShoppingCartProduct>(this, _$identity);
}

abstract class _SelectableShoppingCartProduct
    implements SelectableShoppingCartProduct {
  const factory _SelectableShoppingCartProduct(
      {required ShoppingCartProductDTO product,
      required int count,
      required bool selected}) = _$_SelectableShoppingCartProduct;

  @override
  ShoppingCartProductDTO get product;
  @override
  int get count;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$SelectableShoppingCartProductCopyWith<_SelectableShoppingCartProduct>
      get copyWith => throw _privateConstructorUsedError;
}
