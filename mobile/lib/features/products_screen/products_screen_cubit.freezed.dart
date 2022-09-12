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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductsScreenStateTearOff {
  const _$ProductsScreenStateTearOff();

  ProductsScreenReadyState ready(
      {List<CategoryDTO> categories = const <CategoryDTO>[],
      Map<String, ProductDTO> products = const <String, ProductDTO>{},
      int currentPage = 0,
      int totalCount = 0,
      CategoryDTO? activeCategory,
      bool isLoading = false,
      String search = ''}) {
    return ProductsScreenReadyState(
      categories: categories,
      products: products,
      currentPage: currentPage,
      totalCount: totalCount,
      activeCategory: activeCategory,
      isLoading: isLoading,
      search: search,
    );
  }

  ProductsScreenErrorState error({required String errorMessage}) {
    return ProductsScreenErrorState(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $ProductsScreenState = _$ProductsScreenStateTearOff();

/// @nodoc
mixin _$ProductsScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryDTO> categories,
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)
        ready,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)?
        ready,
    TResult Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)?
        ready,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
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
abstract class $ProductsScreenReadyStateCopyWith<$Res> {
  factory $ProductsScreenReadyStateCopyWith(ProductsScreenReadyState value,
          $Res Function(ProductsScreenReadyState) then) =
      _$ProductsScreenReadyStateCopyWithImpl<$Res>;
  $Res call(
      {List<CategoryDTO> categories,
      Map<String, ProductDTO> products,
      int currentPage,
      int totalCount,
      CategoryDTO? activeCategory,
      bool isLoading,
      String search});
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
    Object? isLoading = freezed,
    Object? search = freezed,
  }) {
    return _then(ProductsScreenReadyState(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, ProductDTO>,
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
              as CategoryDTO?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductsScreenReadyState implements ProductsScreenReadyState {
  const _$ProductsScreenReadyState(
      {this.categories = const <CategoryDTO>[],
      this.products = const <String, ProductDTO>{},
      this.currentPage = 0,
      this.totalCount = 0,
      this.activeCategory,
      this.isLoading = false,
      this.search = ''});

  @JsonKey()
  @override
  final List<CategoryDTO> categories;
  @JsonKey()
  @override
  final Map<String, ProductDTO> products;
  @JsonKey()
  @override
  final int currentPage;
  @JsonKey()
  @override
  final int totalCount;
  @override
  final CategoryDTO? activeCategory;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final String search;

  @override
  String toString() {
    return 'ProductsScreenState.ready(categories: $categories, products: $products, currentPage: $currentPage, totalCount: $totalCount, activeCategory: $activeCategory, isLoading: $isLoading, search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsScreenReadyState &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount) &&
            const DeepCollectionEquality()
                .equals(other.activeCategory, activeCategory) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount),
      const DeepCollectionEquality().hash(activeCategory),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(search));

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
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)
        ready,
    required TResult Function(String errorMessage) error,
  }) {
    return ready(categories, products, currentPage, totalCount, activeCategory,
        isLoading, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)?
        ready,
    TResult Function(String errorMessage)? error,
  }) {
    return ready?.call(categories, products, currentPage, totalCount,
        activeCategory, isLoading, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)?
        ready,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(categories, products, currentPage, totalCount,
          activeCategory, isLoading, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
      {List<CategoryDTO> categories,
      Map<String, ProductDTO> products,
      int currentPage,
      int totalCount,
      CategoryDTO? activeCategory,
      bool isLoading,
      String search}) = _$ProductsScreenReadyState;

  List<CategoryDTO> get categories;
  Map<String, ProductDTO> get products;
  int get currentPage;
  int get totalCount;
  CategoryDTO? get activeCategory;
  bool get isLoading;
  String get search;
  @JsonKey(ignore: true)
  $ProductsScreenReadyStateCopyWith<ProductsScreenReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsScreenErrorStateCopyWith<$Res> {
  factory $ProductsScreenErrorStateCopyWith(ProductsScreenErrorState value,
          $Res Function(ProductsScreenErrorState) then) =
      _$ProductsScreenErrorStateCopyWithImpl<$Res>;
  $Res call({String errorMessage});
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
    Object? errorMessage = freezed,
  }) {
    return _then(ProductsScreenErrorState(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductsScreenErrorState implements ProductsScreenErrorState {
  const _$ProductsScreenErrorState({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProductsScreenState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsScreenErrorState &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

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
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)
        ready,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)?
        ready,
    TResult Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CategoryDTO> categories,
            Map<String, ProductDTO> products,
            int currentPage,
            int totalCount,
            CategoryDTO? activeCategory,
            bool isLoading,
            String search)?
        ready,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductsScreenReadyState value) ready,
    required TResult Function(ProductsScreenErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductsScreenReadyState value)? ready,
    TResult Function(ProductsScreenErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
  const factory ProductsScreenErrorState({required String errorMessage}) =
      _$ProductsScreenErrorState;

  String get errorMessage;
  @JsonKey(ignore: true)
  $ProductsScreenErrorStateCopyWith<ProductsScreenErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
