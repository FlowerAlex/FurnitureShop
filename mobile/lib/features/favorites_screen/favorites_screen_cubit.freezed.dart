// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorites_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavoritesScreenStateTearOff {
  const _$FavoritesScreenStateTearOff();

  FavoritesLoadingState loading() {
    return const FavoritesLoadingState();
  }

  FavoritesReadyState ready(
      {required ShoppingCartDTO shoppingCart,
      required CategoryDTO activeCategory,
      List<CategoryDTO> categories = const <CategoryDTO>[],
      int currentPage = 0,
      int totalCount = 0}) {
    return FavoritesReadyState(
      shoppingCart: shoppingCart,
      activeCategory: activeCategory,
      categories: categories,
      currentPage: currentPage,
      totalCount: totalCount,
    );
  }

  FavoritesErrorState error({required String error}) {
    return FavoritesErrorState(
      error: error,
    );
  }
}

/// @nodoc
const $FavoritesScreenState = _$FavoritesScreenStateTearOff();

/// @nodoc
mixin _$FavoritesScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
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
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesLoadingState value) loading,
    required TResult Function(FavoritesReadyState value) ready,
    required TResult Function(FavoritesErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesScreenStateCopyWith<$Res> {
  factory $FavoritesScreenStateCopyWith(FavoritesScreenState value,
          $Res Function(FavoritesScreenState) then) =
      _$FavoritesScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesScreenStateCopyWithImpl<$Res>
    implements $FavoritesScreenStateCopyWith<$Res> {
  _$FavoritesScreenStateCopyWithImpl(this._value, this._then);

  final FavoritesScreenState _value;
  // ignore: unused_field
  final $Res Function(FavoritesScreenState) _then;
}

/// @nodoc
abstract class $FavoritesLoadingStateCopyWith<$Res> {
  factory $FavoritesLoadingStateCopyWith(FavoritesLoadingState value,
          $Res Function(FavoritesLoadingState) then) =
      _$FavoritesLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesLoadingStateCopyWithImpl<$Res>
    extends _$FavoritesScreenStateCopyWithImpl<$Res>
    implements $FavoritesLoadingStateCopyWith<$Res> {
  _$FavoritesLoadingStateCopyWithImpl(
      FavoritesLoadingState _value, $Res Function(FavoritesLoadingState) _then)
      : super(_value, (v) => _then(v as FavoritesLoadingState));

  @override
  FavoritesLoadingState get _value => super._value as FavoritesLoadingState;
}

/// @nodoc

class _$FavoritesLoadingState implements FavoritesLoadingState {
  const _$FavoritesLoadingState();

  @override
  String toString() {
    return 'FavoritesScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoritesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
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
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
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
    required TResult Function(FavoritesLoadingState value) loading,
    required TResult Function(FavoritesReadyState value) ready,
    required TResult Function(FavoritesErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoritesLoadingState implements FavoritesScreenState {
  const factory FavoritesLoadingState() = _$FavoritesLoadingState;
}

/// @nodoc
abstract class $FavoritesReadyStateCopyWith<$Res> {
  factory $FavoritesReadyStateCopyWith(
          FavoritesReadyState value, $Res Function(FavoritesReadyState) then) =
      _$FavoritesReadyStateCopyWithImpl<$Res>;
  $Res call(
      {ShoppingCartDTO shoppingCart,
      CategoryDTO activeCategory,
      List<CategoryDTO> categories,
      int currentPage,
      int totalCount});
}

/// @nodoc
class _$FavoritesReadyStateCopyWithImpl<$Res>
    extends _$FavoritesScreenStateCopyWithImpl<$Res>
    implements $FavoritesReadyStateCopyWith<$Res> {
  _$FavoritesReadyStateCopyWithImpl(
      FavoritesReadyState _value, $Res Function(FavoritesReadyState) _then)
      : super(_value, (v) => _then(v as FavoritesReadyState));

  @override
  FavoritesReadyState get _value => super._value as FavoritesReadyState;

  @override
  $Res call({
    Object? shoppingCart = freezed,
    Object? activeCategory = freezed,
    Object? categories = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(FavoritesReadyState(
      shoppingCart: shoppingCart == freezed
          ? _value.shoppingCart
          : shoppingCart // ignore: cast_nullable_to_non_nullable
              as ShoppingCartDTO,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
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

class _$FavoritesReadyState implements FavoritesReadyState {
  const _$FavoritesReadyState(
      {required this.shoppingCart,
      required this.activeCategory,
      this.categories = const <CategoryDTO>[],
      this.currentPage = 0,
      this.totalCount = 0});

  @override
  final ShoppingCartDTO shoppingCart;
  @override
  final CategoryDTO activeCategory;
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
    return 'FavoritesScreenState.ready(shoppingCart: $shoppingCart, activeCategory: $activeCategory, categories: $categories, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoritesReadyState &&
            const DeepCollectionEquality()
                .equals(other.shoppingCart, shoppingCart) &&
            const DeepCollectionEquality()
                .equals(other.activeCategory, activeCategory) &&
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
      const DeepCollectionEquality().hash(shoppingCart),
      const DeepCollectionEquality().hash(activeCategory),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  $FavoritesReadyStateCopyWith<FavoritesReadyState> get copyWith =>
      _$FavoritesReadyStateCopyWithImpl<FavoritesReadyState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(
        shoppingCart, activeCategory, categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(
        shoppingCart, activeCategory, categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(
          shoppingCart, activeCategory, categories, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesLoadingState value) loading,
    required TResult Function(FavoritesReadyState value) ready,
    required TResult Function(FavoritesErrorState value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class FavoritesReadyState implements FavoritesScreenState {
  const factory FavoritesReadyState(
      {required ShoppingCartDTO shoppingCart,
      required CategoryDTO activeCategory,
      List<CategoryDTO> categories,
      int currentPage,
      int totalCount}) = _$FavoritesReadyState;

  ShoppingCartDTO get shoppingCart;
  CategoryDTO get activeCategory;
  List<CategoryDTO> get categories;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  $FavoritesReadyStateCopyWith<FavoritesReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesErrorStateCopyWith<$Res> {
  factory $FavoritesErrorStateCopyWith(
          FavoritesErrorState value, $Res Function(FavoritesErrorState) then) =
      _$FavoritesErrorStateCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$FavoritesErrorStateCopyWithImpl<$Res>
    extends _$FavoritesScreenStateCopyWithImpl<$Res>
    implements $FavoritesErrorStateCopyWith<$Res> {
  _$FavoritesErrorStateCopyWithImpl(
      FavoritesErrorState _value, $Res Function(FavoritesErrorState) _then)
      : super(_value, (v) => _then(v as FavoritesErrorState));

  @override
  FavoritesErrorState get _value => super._value as FavoritesErrorState;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(FavoritesErrorState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoritesErrorState implements FavoritesErrorState {
  const _$FavoritesErrorState({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'FavoritesScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoritesErrorState &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $FavoritesErrorStateCopyWith<FavoritesErrorState> get copyWith =>
      _$FavoritesErrorStateCopyWithImpl<FavoritesErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
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
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
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
    required TResult Function(FavoritesLoadingState value) loading,
    required TResult Function(FavoritesReadyState value) ready,
    required TResult Function(FavoritesErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesLoadingState value)? loading,
    TResult Function(FavoritesReadyState value)? ready,
    TResult Function(FavoritesErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FavoritesErrorState implements FavoritesScreenState {
  const factory FavoritesErrorState({required String error}) =
      _$FavoritesErrorState;

  String get error;
  @JsonKey(ignore: true)
  $FavoritesErrorStateCopyWith<FavoritesErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
