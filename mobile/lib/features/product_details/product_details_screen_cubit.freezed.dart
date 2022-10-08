// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_details_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductDetailsScreenStateTearOff {
  const _$ProductDetailsScreenStateTearOff();

  ProductDetailsScreenStateLoading loading() {
    return const ProductDetailsScreenStateLoading();
  }

  ProductDetailsScreenStateReady ready(
      {required ProductDetailsDTO productDetails,
      required Map<String, ReviewDTO> reviews,
      required ReviewDataDTO? myReviewData,
      required int currentPage,
      required int totalCount}) {
    return ProductDetailsScreenStateReady(
      productDetails: productDetails,
      reviews: reviews,
      myReviewData: myReviewData,
      currentPage: currentPage,
      totalCount: totalCount,
    );
  }

  ProductDetailsScreenStateError error({required String errorMessage}) {
    return ProductDetailsScreenStateError(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $ProductDetailsScreenState = _$ProductDetailsScreenStateTearOff();

/// @nodoc
mixin _$ProductDetailsScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsScreenStateLoading value) loading,
    required TResult Function(ProductDetailsScreenStateReady value) ready,
    required TResult Function(ProductDetailsScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsScreenStateCopyWith<$Res> {
  factory $ProductDetailsScreenStateCopyWith(ProductDetailsScreenState value,
          $Res Function(ProductDetailsScreenState) then) =
      _$ProductDetailsScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductDetailsScreenStateCopyWithImpl<$Res>
    implements $ProductDetailsScreenStateCopyWith<$Res> {
  _$ProductDetailsScreenStateCopyWithImpl(this._value, this._then);

  final ProductDetailsScreenState _value;
  // ignore: unused_field
  final $Res Function(ProductDetailsScreenState) _then;
}

/// @nodoc
abstract class $ProductDetailsScreenStateLoadingCopyWith<$Res> {
  factory $ProductDetailsScreenStateLoadingCopyWith(
          ProductDetailsScreenStateLoading value,
          $Res Function(ProductDetailsScreenStateLoading) then) =
      _$ProductDetailsScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductDetailsScreenStateLoadingCopyWithImpl<$Res>
    extends _$ProductDetailsScreenStateCopyWithImpl<$Res>
    implements $ProductDetailsScreenStateLoadingCopyWith<$Res> {
  _$ProductDetailsScreenStateLoadingCopyWithImpl(
      ProductDetailsScreenStateLoading _value,
      $Res Function(ProductDetailsScreenStateLoading) _then)
      : super(_value, (v) => _then(v as ProductDetailsScreenStateLoading));

  @override
  ProductDetailsScreenStateLoading get _value =>
      super._value as ProductDetailsScreenStateLoading;
}

/// @nodoc

class _$ProductDetailsScreenStateLoading
    implements ProductDetailsScreenStateLoading {
  const _$ProductDetailsScreenStateLoading();

  @override
  String toString() {
    return 'ProductDetailsScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String errorMessage)? error,
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
    required TResult Function(ProductDetailsScreenStateLoading value) loading,
    required TResult Function(ProductDetailsScreenStateReady value) ready,
    required TResult Function(ProductDetailsScreenStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsScreenStateLoading
    implements ProductDetailsScreenState {
  const factory ProductDetailsScreenStateLoading() =
      _$ProductDetailsScreenStateLoading;
}

/// @nodoc
abstract class $ProductDetailsScreenStateReadyCopyWith<$Res> {
  factory $ProductDetailsScreenStateReadyCopyWith(
          ProductDetailsScreenStateReady value,
          $Res Function(ProductDetailsScreenStateReady) then) =
      _$ProductDetailsScreenStateReadyCopyWithImpl<$Res>;
  $Res call(
      {ProductDetailsDTO productDetails,
      Map<String, ReviewDTO> reviews,
      ReviewDataDTO? myReviewData,
      int currentPage,
      int totalCount});
}

/// @nodoc
class _$ProductDetailsScreenStateReadyCopyWithImpl<$Res>
    extends _$ProductDetailsScreenStateCopyWithImpl<$Res>
    implements $ProductDetailsScreenStateReadyCopyWith<$Res> {
  _$ProductDetailsScreenStateReadyCopyWithImpl(
      ProductDetailsScreenStateReady _value,
      $Res Function(ProductDetailsScreenStateReady) _then)
      : super(_value, (v) => _then(v as ProductDetailsScreenStateReady));

  @override
  ProductDetailsScreenStateReady get _value =>
      super._value as ProductDetailsScreenStateReady;

  @override
  $Res call({
    Object? productDetails = freezed,
    Object? reviews = freezed,
    Object? myReviewData = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(ProductDetailsScreenStateReady(
      productDetails: productDetails == freezed
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as ProductDetailsDTO,
      reviews: reviews == freezed
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as Map<String, ReviewDTO>,
      myReviewData: myReviewData == freezed
          ? _value.myReviewData
          : myReviewData // ignore: cast_nullable_to_non_nullable
              as ReviewDataDTO?,
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

class _$ProductDetailsScreenStateReady
    implements ProductDetailsScreenStateReady {
  const _$ProductDetailsScreenStateReady(
      {required this.productDetails,
      required this.reviews,
      required this.myReviewData,
      required this.currentPage,
      required this.totalCount});

  @override
  final ProductDetailsDTO productDetails;
  @override
  final Map<String, ReviewDTO> reviews;
  @override
  final ReviewDataDTO? myReviewData;
  @override
  final int currentPage;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ProductDetailsScreenState.ready(productDetails: $productDetails, reviews: $reviews, myReviewData: $myReviewData, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsScreenStateReady &&
            const DeepCollectionEquality()
                .equals(other.productDetails, productDetails) &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            const DeepCollectionEquality()
                .equals(other.myReviewData, myReviewData) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productDetails),
      const DeepCollectionEquality().hash(reviews),
      const DeepCollectionEquality().hash(myReviewData),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  $ProductDetailsScreenStateReadyCopyWith<ProductDetailsScreenStateReady>
      get copyWith => _$ProductDetailsScreenStateReadyCopyWithImpl<
          ProductDetailsScreenStateReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String errorMessage) error,
  }) {
    return ready(
        productDetails, reviews, myReviewData, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String errorMessage)? error,
  }) {
    return ready?.call(
        productDetails, reviews, myReviewData, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(
          productDetails, reviews, myReviewData, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsScreenStateLoading value) loading,
    required TResult Function(ProductDetailsScreenStateReady value) ready,
    required TResult Function(ProductDetailsScreenStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsScreenStateReady
    implements ProductDetailsScreenState {
  const factory ProductDetailsScreenStateReady(
      {required ProductDetailsDTO productDetails,
      required Map<String, ReviewDTO> reviews,
      required ReviewDataDTO? myReviewData,
      required int currentPage,
      required int totalCount}) = _$ProductDetailsScreenStateReady;

  ProductDetailsDTO get productDetails;
  Map<String, ReviewDTO> get reviews;
  ReviewDataDTO? get myReviewData;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  $ProductDetailsScreenStateReadyCopyWith<ProductDetailsScreenStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsScreenStateErrorCopyWith<$Res> {
  factory $ProductDetailsScreenStateErrorCopyWith(
          ProductDetailsScreenStateError value,
          $Res Function(ProductDetailsScreenStateError) then) =
      _$ProductDetailsScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$ProductDetailsScreenStateErrorCopyWithImpl<$Res>
    extends _$ProductDetailsScreenStateCopyWithImpl<$Res>
    implements $ProductDetailsScreenStateErrorCopyWith<$Res> {
  _$ProductDetailsScreenStateErrorCopyWithImpl(
      ProductDetailsScreenStateError _value,
      $Res Function(ProductDetailsScreenStateError) _then)
      : super(_value, (v) => _then(v as ProductDetailsScreenStateError));

  @override
  ProductDetailsScreenStateError get _value =>
      super._value as ProductDetailsScreenStateError;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(ProductDetailsScreenStateError(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductDetailsScreenStateError
    implements ProductDetailsScreenStateError {
  const _$ProductDetailsScreenStateError({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProductDetailsScreenState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsScreenStateError &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  $ProductDetailsScreenStateErrorCopyWith<ProductDetailsScreenStateError>
      get copyWith => _$ProductDetailsScreenStateErrorCopyWithImpl<
          ProductDetailsScreenStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
        ready,
    TResult Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ProductDetailsDTO productDetails,
            Map<String, ReviewDTO> reviews,
            ReviewDataDTO? myReviewData,
            int currentPage,
            int totalCount)?
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
    required TResult Function(ProductDetailsScreenStateLoading value) loading,
    required TResult Function(ProductDetailsScreenStateReady value) ready,
    required TResult Function(ProductDetailsScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsScreenStateLoading value)? loading,
    TResult Function(ProductDetailsScreenStateReady value)? ready,
    TResult Function(ProductDetailsScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsScreenStateError
    implements ProductDetailsScreenState {
  const factory ProductDetailsScreenStateError({required String errorMessage}) =
      _$ProductDetailsScreenStateError;

  String get errorMessage;
  @JsonKey(ignore: true)
  $ProductDetailsScreenStateErrorCopyWith<ProductDetailsScreenStateError>
      get copyWith => throw _privateConstructorUsedError;
}
