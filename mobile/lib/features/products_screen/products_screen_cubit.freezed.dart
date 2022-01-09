// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'products_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductsScreenStateTearOff {
  const _$ProductsScreenStateTearOff();

  ProductsScreenInitialState initial(
      {List<CategoryDTO> categories = const <CategoryDTO>[],
      List<ProductDTO> products = const <ProductDTO>[],
      int currentPage = 0,
      int totalCount = 0,
      required CategoryDTO activeCategory}) {
    return ProductsScreenInitialState(
      categories: categories,
      products: products,
      currentPage: currentPage,
      totalCount: totalCount,
      activeCategory: activeCategory,
    );
  }

  ProductsScreenLoadingState loading(
      {List<CategoryDTO> categories = const <CategoryDTO>[],
      List<ProductDTO> products = const <ProductDTO>[],
      int currentPage = 0,
      int totalCount = 0,
      required CategoryDTO activeCategory}) {
    return ProductsScreenLoadingState(
      categories: categories,
      products: products,
      currentPage: currentPage,
      totalCount: totalCount,
      activeCategory: activeCategory,
    );
  }

  ProductsScreenReadyState ready(
      {required List<CategoryDTO> categories,
      required List<ProductDTO> products,
      required int currentPage,
      required int totalCount,
      required CategoryDTO activeCategory}) {
    return ProductsScreenReadyState(
      categories: categories,
      products: products,
      currentPage: currentPage,
      totalCount: totalCount,
      activeCategory: activeCategory,
    );
  }

  ProductsScreenErrorState error(
      {required List<CategoryDTO> categories,
      required List<ProductDTO> products,
      required int currentPage,
      required int totalCount,
      required CategoryDTO activeCategory}) {
    return ProductsScreenErrorState(
      categories: categories,
      products: products,
      currentPage: currentPage,
      totalCount: totalCount,
      activeCategory: activeCategory,
    );
  }
}

/// @nodoc
const $ProductsScreenState = _$ProductsScreenStateTearOff();

/// @nodoc
mixin _$ProductsScreenState {
  List<CategoryDTO> get categories => throw _privateConstructorUsedError;
  List<ProductDTO> get products => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  CategoryDTO get activeCategory => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        initial,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        loading,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        ready,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenInitialState value) initial,
    required TResult Function(ProductsScreenLoadingState value) loading,
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsScreenStateCopyWith<ProductsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsScreenStateCopyWith<$Res> {
  factory $ProductsScreenStateCopyWith(
          ProductsScreenState value, $Res Function(ProductsScreenState) then) =
      _$ProductsScreenStateCopyWithImpl<$Res>;
  $Res call(
      {List<CategoryDTO> categories,
      List<ProductDTO> products,
      int currentPage,
      int totalCount,
      CategoryDTO activeCategory});
}

/// @nodoc
class _$ProductsScreenStateCopyWithImpl<$Res>
    implements $ProductsScreenStateCopyWith<$Res> {
  _$ProductsScreenStateCopyWithImpl(this._value, this._then);

  final ProductsScreenState _value;
  // ignore: unused_field
  final $Res Function(ProductsScreenState) _then;

  @override
  $Res call({
    Object? categories = freezed,
    Object? products = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
    Object? activeCategory = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
    ));
  }
}

/// @nodoc
abstract class $ProductsScreenInitialStateCopyWith<$Res>
    implements $ProductsScreenStateCopyWith<$Res> {
  factory $ProductsScreenInitialStateCopyWith(ProductsScreenInitialState value,
          $Res Function(ProductsScreenInitialState) then) =
      _$ProductsScreenInitialStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryDTO> categories,
      List<ProductDTO> products,
      int currentPage,
      int totalCount,
      CategoryDTO activeCategory});
}

/// @nodoc
class _$ProductsScreenInitialStateCopyWithImpl<$Res>
    extends _$ProductsScreenStateCopyWithImpl<$Res>
    implements $ProductsScreenInitialStateCopyWith<$Res> {
  _$ProductsScreenInitialStateCopyWithImpl(ProductsScreenInitialState _value,
      $Res Function(ProductsScreenInitialState) _then)
      : super(_value, (v) => _then(v as ProductsScreenInitialState));

  @override
  ProductsScreenInitialState get _value =>
      super._value as ProductsScreenInitialState;

  @override
  $Res call({
    Object? categories = freezed,
    Object? products = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
    Object? activeCategory = freezed,
  }) {
    return _then(ProductsScreenInitialState(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
    ));
  }
}

/// @nodoc

class _$ProductsScreenInitialState implements ProductsScreenInitialState {
  _$ProductsScreenInitialState(
      {this.categories = const <CategoryDTO>[],
      this.products = const <ProductDTO>[],
      this.currentPage = 0,
      this.totalCount = 0,
      required this.activeCategory});

  @JsonKey(defaultValue: const <CategoryDTO>[])
  @override
  final List<CategoryDTO> categories;
  @JsonKey(defaultValue: const <ProductDTO>[])
  @override
  final List<ProductDTO> products;
  @JsonKey(defaultValue: 0)
  @override
  final int currentPage;
  @JsonKey(defaultValue: 0)
  @override
  final int totalCount;
  @override
  final CategoryDTO activeCategory;

  @override
  String toString() {
    return 'ProductsScreenState.initial(categories: $categories, products: $products, currentPage: $currentPage, totalCount: $totalCount, activeCategory: $activeCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsScreenInitialState &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.activeCategory, activeCategory) ||
                other.activeCategory == activeCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(products),
      currentPage,
      totalCount,
      activeCategory);

  @JsonKey(ignore: true)
  @override
  $ProductsScreenInitialStateCopyWith<ProductsScreenInitialState>
      get copyWith =>
          _$ProductsScreenInitialStateCopyWithImpl<ProductsScreenInitialState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        initial,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        loading,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        ready,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        error,
  }) {
    return initial(
        categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
  }) {
    return initial?.call(
        categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          categories, products, currentPage, totalCount, activeCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenInitialState value) initial,
    required TResult Function(ProductsScreenLoadingState value) loading,
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProductsScreenInitialState implements ProductsScreenState {
  factory ProductsScreenInitialState(
      {List<CategoryDTO> categories,
      List<ProductDTO> products,
      int currentPage,
      int totalCount,
      required CategoryDTO activeCategory}) = _$ProductsScreenInitialState;

  @override
  List<CategoryDTO> get categories;
  @override
  List<ProductDTO> get products;
  @override
  int get currentPage;
  @override
  int get totalCount;
  @override
  CategoryDTO get activeCategory;
  @override
  @JsonKey(ignore: true)
  $ProductsScreenInitialStateCopyWith<ProductsScreenInitialState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsScreenLoadingStateCopyWith<$Res>
    implements $ProductsScreenStateCopyWith<$Res> {
  factory $ProductsScreenLoadingStateCopyWith(ProductsScreenLoadingState value,
          $Res Function(ProductsScreenLoadingState) then) =
      _$ProductsScreenLoadingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryDTO> categories,
      List<ProductDTO> products,
      int currentPage,
      int totalCount,
      CategoryDTO activeCategory});
}

/// @nodoc
class _$ProductsScreenLoadingStateCopyWithImpl<$Res>
    extends _$ProductsScreenStateCopyWithImpl<$Res>
    implements $ProductsScreenLoadingStateCopyWith<$Res> {
  _$ProductsScreenLoadingStateCopyWithImpl(ProductsScreenLoadingState _value,
      $Res Function(ProductsScreenLoadingState) _then)
      : super(_value, (v) => _then(v as ProductsScreenLoadingState));

  @override
  ProductsScreenLoadingState get _value =>
      super._value as ProductsScreenLoadingState;

  @override
  $Res call({
    Object? categories = freezed,
    Object? products = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
    Object? activeCategory = freezed,
  }) {
    return _then(ProductsScreenLoadingState(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
    ));
  }
}

/// @nodoc

class _$ProductsScreenLoadingState implements ProductsScreenLoadingState {
  const _$ProductsScreenLoadingState(
      {this.categories = const <CategoryDTO>[],
      this.products = const <ProductDTO>[],
      this.currentPage = 0,
      this.totalCount = 0,
      required this.activeCategory});

  @JsonKey(defaultValue: const <CategoryDTO>[])
  @override
  final List<CategoryDTO> categories;
  @JsonKey(defaultValue: const <ProductDTO>[])
  @override
  final List<ProductDTO> products;
  @JsonKey(defaultValue: 0)
  @override
  final int currentPage;
  @JsonKey(defaultValue: 0)
  @override
  final int totalCount;
  @override
  final CategoryDTO activeCategory;

  @override
  String toString() {
    return 'ProductsScreenState.loading(categories: $categories, products: $products, currentPage: $currentPage, totalCount: $totalCount, activeCategory: $activeCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsScreenLoadingState &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.activeCategory, activeCategory) ||
                other.activeCategory == activeCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(products),
      currentPage,
      totalCount,
      activeCategory);

  @JsonKey(ignore: true)
  @override
  $ProductsScreenLoadingStateCopyWith<ProductsScreenLoadingState>
      get copyWith =>
          _$ProductsScreenLoadingStateCopyWithImpl<ProductsScreenLoadingState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        initial,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        loading,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        ready,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        error,
  }) {
    return loading(
        categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
  }) {
    return loading?.call(
        categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(
          categories, products, currentPage, totalCount, activeCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenInitialState value) initial,
    required TResult Function(ProductsScreenLoadingState value) loading,
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductsScreenLoadingState implements ProductsScreenState {
  const factory ProductsScreenLoadingState(
      {List<CategoryDTO> categories,
      List<ProductDTO> products,
      int currentPage,
      int totalCount,
      required CategoryDTO activeCategory}) = _$ProductsScreenLoadingState;

  @override
  List<CategoryDTO> get categories;
  @override
  List<ProductDTO> get products;
  @override
  int get currentPage;
  @override
  int get totalCount;
  @override
  CategoryDTO get activeCategory;
  @override
  @JsonKey(ignore: true)
  $ProductsScreenLoadingStateCopyWith<ProductsScreenLoadingState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsScreenReadyStateCopyWith<$Res>
    implements $ProductsScreenStateCopyWith<$Res> {
  factory $ProductsScreenReadyStateCopyWith(ProductsScreenReadyState value,
          $Res Function(ProductsScreenReadyState) then) =
      _$ProductsScreenReadyStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryDTO> categories,
      List<ProductDTO> products,
      int currentPage,
      int totalCount,
      CategoryDTO activeCategory});
}

/// @nodoc
class _$ProductsScreenReadyStateCopyWithImpl<$Res>
    extends _$ProductsScreenStateCopyWithImpl<$Res>
    implements $ProductsScreenReadyStateCopyWith<$Res> {
  _$ProductsScreenReadyStateCopyWithImpl(ProductsScreenReadyState _value,
      $Res Function(ProductsScreenReadyState) _then)
      : super(_value, (v) => _then(v as ProductsScreenReadyState));

  @override
  ProductsScreenReadyState get _value =>
      super._value as ProductsScreenReadyState;

  @override
  $Res call({
    Object? categories = freezed,
    Object? products = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
    Object? activeCategory = freezed,
  }) {
    return _then(ProductsScreenReadyState(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
    ));
  }
}

/// @nodoc

class _$ProductsScreenReadyState implements ProductsScreenReadyState {
  const _$ProductsScreenReadyState(
      {required this.categories,
      required this.products,
      required this.currentPage,
      required this.totalCount,
      required this.activeCategory});

  @override
  final List<CategoryDTO> categories;
  @override
  final List<ProductDTO> products;
  @override
  final int currentPage;
  @override
  final int totalCount;
  @override
  final CategoryDTO activeCategory;

  @override
  String toString() {
    return 'ProductsScreenState.ready(categories: $categories, products: $products, currentPage: $currentPage, totalCount: $totalCount, activeCategory: $activeCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsScreenReadyState &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.activeCategory, activeCategory) ||
                other.activeCategory == activeCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(products),
      currentPage,
      totalCount,
      activeCategory);

  @JsonKey(ignore: true)
  @override
  $ProductsScreenReadyStateCopyWith<ProductsScreenReadyState> get copyWith =>
      _$ProductsScreenReadyStateCopyWithImpl<ProductsScreenReadyState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        initial,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        loading,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        ready,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        error,
  }) {
    return ready(categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
  }) {
    return ready?.call(
        categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(
          categories, products, currentPage, totalCount, activeCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenInitialState value) initial,
    required TResult Function(ProductsScreenLoadingState value) loading,
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ProductsScreenReadyState implements ProductsScreenState {
  const factory ProductsScreenReadyState(
      {required List<CategoryDTO> categories,
      required List<ProductDTO> products,
      required int currentPage,
      required int totalCount,
      required CategoryDTO activeCategory}) = _$ProductsScreenReadyState;

  @override
  List<CategoryDTO> get categories;
  @override
  List<ProductDTO> get products;
  @override
  int get currentPage;
  @override
  int get totalCount;
  @override
  CategoryDTO get activeCategory;
  @override
  @JsonKey(ignore: true)
  $ProductsScreenReadyStateCopyWith<ProductsScreenReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsScreenErrorStateCopyWith<$Res>
    implements $ProductsScreenStateCopyWith<$Res> {
  factory $ProductsScreenErrorStateCopyWith(ProductsScreenErrorState value,
          $Res Function(ProductsScreenErrorState) then) =
      _$ProductsScreenErrorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryDTO> categories,
      List<ProductDTO> products,
      int currentPage,
      int totalCount,
      CategoryDTO activeCategory});
}

/// @nodoc
class _$ProductsScreenErrorStateCopyWithImpl<$Res>
    extends _$ProductsScreenStateCopyWithImpl<$Res>
    implements $ProductsScreenErrorStateCopyWith<$Res> {
  _$ProductsScreenErrorStateCopyWithImpl(ProductsScreenErrorState _value,
      $Res Function(ProductsScreenErrorState) _then)
      : super(_value, (v) => _then(v as ProductsScreenErrorState));

  @override
  ProductsScreenErrorState get _value =>
      super._value as ProductsScreenErrorState;

  @override
  $Res call({
    Object? categories = freezed,
    Object? products = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
    Object? activeCategory = freezed,
  }) {
    return _then(ProductsScreenErrorState(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
    ));
  }
}

/// @nodoc

class _$ProductsScreenErrorState implements ProductsScreenErrorState {
  const _$ProductsScreenErrorState(
      {required this.categories,
      required this.products,
      required this.currentPage,
      required this.totalCount,
      required this.activeCategory});

  @override
  final List<CategoryDTO> categories;
  @override
  final List<ProductDTO> products;
  @override
  final int currentPage;
  @override
  final int totalCount;
  @override
  final CategoryDTO activeCategory;

  @override
  String toString() {
    return 'ProductsScreenState.error(categories: $categories, products: $products, currentPage: $currentPage, totalCount: $totalCount, activeCategory: $activeCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsScreenErrorState &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.activeCategory, activeCategory) ||
                other.activeCategory == activeCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(products),
      currentPage,
      totalCount,
      activeCategory);

  @JsonKey(ignore: true)
  @override
  $ProductsScreenErrorStateCopyWith<ProductsScreenErrorState> get copyWith =>
      _$ProductsScreenErrorStateCopyWithImpl<ProductsScreenErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        initial,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        loading,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        ready,
    required TResult Function(
            List<CategoryDTO> categories,
            List<ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO activeCategory)
        error,
  }) {
    return error(categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
  }) {
    return error?.call(
        categories, products, currentPage, totalCount, activeCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        initial,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        loading,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        ready,
    TResult Function(List<CategoryDTO> categories, List<ProductDTO> products,
            int currentPage, int totalCount, CategoryDTO activeCategory)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(
          categories, products, currentPage, totalCount, activeCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenInitialState value) initial,
    required TResult Function(ProductsScreenLoadingState value) loading,
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenInitialState value)? initial,
    TResult Function(ProductsScreenLoadingState value)? loading,
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductsScreenErrorState implements ProductsScreenState {
  const factory ProductsScreenErrorState(
      {required List<CategoryDTO> categories,
      required List<ProductDTO> products,
      required int currentPage,
      required int totalCount,
      required CategoryDTO activeCategory}) = _$ProductsScreenErrorState;

  @override
  List<CategoryDTO> get categories;
  @override
  List<ProductDTO> get products;
  @override
  int get currentPage;
  @override
  int get totalCount;
  @override
  CategoryDTO get activeCategory;
  @override
  @JsonKey(ignore: true)
  $ProductsScreenErrorStateCopyWith<ProductsScreenErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
