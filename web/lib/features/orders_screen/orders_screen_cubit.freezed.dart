// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'orders_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrdersScreenStateTearOff {
  const _$OrdersScreenStateTearOff();

  OrdersScreenStateReady ready(
      {Map<int, List<OrderDTO>> orders = const <int, List<OrderDTO>>{},
      int currentPage = 0,
      int totalCount = 0}) {
    return OrdersScreenStateReady(
      orders: orders,
      currentPage: currentPage,
      totalCount: totalCount,
    );
  }

  OrdersScreenStateError error({required String error}) {
    return OrdersScreenStateError(
      error: error,
    );
  }
}

/// @nodoc
const $OrdersScreenState = _$OrdersScreenStateTearOff();

/// @nodoc
mixin _$OrdersScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersScreenStateReady value) ready,
    required TResult Function(OrdersScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OrdersScreenStateReady value)? ready,
    TResult Function(OrdersScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersScreenStateReady value)? ready,
    TResult Function(OrdersScreenStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersScreenStateCopyWith<$Res> {
  factory $OrdersScreenStateCopyWith(
          OrdersScreenState value, $Res Function(OrdersScreenState) then) =
      _$OrdersScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OrdersScreenStateCopyWithImpl<$Res>
    implements $OrdersScreenStateCopyWith<$Res> {
  _$OrdersScreenStateCopyWithImpl(this._value, this._then);

  final OrdersScreenState _value;
  // ignore: unused_field
  final $Res Function(OrdersScreenState) _then;
}

/// @nodoc
abstract class $OrdersScreenStateReadyCopyWith<$Res> {
  factory $OrdersScreenStateReadyCopyWith(OrdersScreenStateReady value,
          $Res Function(OrdersScreenStateReady) then) =
      _$OrdersScreenStateReadyCopyWithImpl<$Res>;
  $Res call({Map<int, List<OrderDTO>> orders, int currentPage, int totalCount});
}

/// @nodoc
class _$OrdersScreenStateReadyCopyWithImpl<$Res>
    extends _$OrdersScreenStateCopyWithImpl<$Res>
    implements $OrdersScreenStateReadyCopyWith<$Res> {
  _$OrdersScreenStateReadyCopyWithImpl(OrdersScreenStateReady _value,
      $Res Function(OrdersScreenStateReady) _then)
      : super(_value, (v) => _then(v as OrdersScreenStateReady));

  @override
  OrdersScreenStateReady get _value => super._value as OrdersScreenStateReady;

  @override
  $Res call({
    Object? orders = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(OrdersScreenStateReady(
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as Map<int, List<OrderDTO>>,
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

class _$OrdersScreenStateReady implements OrdersScreenStateReady {
  const _$OrdersScreenStateReady(
      {this.orders = const <int, List<OrderDTO>>{},
      this.currentPage = 0,
      this.totalCount = 0});

  @JsonKey()
  @override
  final Map<int, List<OrderDTO>> orders;
  @JsonKey()
  @override
  final int currentPage;
  @JsonKey()
  @override
  final int totalCount;

  @override
  String toString() {
    return 'OrdersScreenState.ready(orders: $orders, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersScreenStateReady &&
            const DeepCollectionEquality().equals(other.orders, orders) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orders),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  $OrdersScreenStateReadyCopyWith<OrdersScreenStateReady> get copyWith =>
      _$OrdersScreenStateReadyCopyWithImpl<OrdersScreenStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(orders, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(orders, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(orders, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersScreenStateReady value) ready,
    required TResult Function(OrdersScreenStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OrdersScreenStateReady value)? ready,
    TResult Function(OrdersScreenStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersScreenStateReady value)? ready,
    TResult Function(OrdersScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class OrdersScreenStateReady implements OrdersScreenState {
  const factory OrdersScreenStateReady(
      {Map<int, List<OrderDTO>> orders,
      int currentPage,
      int totalCount}) = _$OrdersScreenStateReady;

  Map<int, List<OrderDTO>> get orders;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  $OrdersScreenStateReadyCopyWith<OrdersScreenStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersScreenStateErrorCopyWith<$Res> {
  factory $OrdersScreenStateErrorCopyWith(OrdersScreenStateError value,
          $Res Function(OrdersScreenStateError) then) =
      _$OrdersScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$OrdersScreenStateErrorCopyWithImpl<$Res>
    extends _$OrdersScreenStateCopyWithImpl<$Res>
    implements $OrdersScreenStateErrorCopyWith<$Res> {
  _$OrdersScreenStateErrorCopyWithImpl(OrdersScreenStateError _value,
      $Res Function(OrdersScreenStateError) _then)
      : super(_value, (v) => _then(v as OrdersScreenStateError));

  @override
  OrdersScreenStateError get _value => super._value as OrdersScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(OrdersScreenStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrdersScreenStateError implements OrdersScreenStateError {
  const _$OrdersScreenStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OrdersScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $OrdersScreenStateErrorCopyWith<OrdersScreenStateError> get copyWith =>
      _$OrdersScreenStateErrorCopyWithImpl<OrdersScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<int, List<OrderDTO>> orders, int currentPage, int totalCount)?
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
    required TResult Function(OrdersScreenStateReady value) ready,
    required TResult Function(OrdersScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OrdersScreenStateReady value)? ready,
    TResult Function(OrdersScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersScreenStateReady value)? ready,
    TResult Function(OrdersScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrdersScreenStateError implements OrdersScreenState {
  const factory OrdersScreenStateError({required String error}) =
      _$OrdersScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  $OrdersScreenStateErrorCopyWith<OrdersScreenStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
