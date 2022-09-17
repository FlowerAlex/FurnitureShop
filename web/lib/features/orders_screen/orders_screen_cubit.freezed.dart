// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'orders_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$OrdersScreenStateReadyCopyWith<$Res> {
  factory _$$OrdersScreenStateReadyCopyWith(_$OrdersScreenStateReady value,
          $Res Function(_$OrdersScreenStateReady) then) =
      __$$OrdersScreenStateReadyCopyWithImpl<$Res>;
  $Res call({Map<int, List<OrderDTO>> orders, int currentPage, int totalCount});
}

/// @nodoc
class __$$OrdersScreenStateReadyCopyWithImpl<$Res>
    extends _$OrdersScreenStateCopyWithImpl<$Res>
    implements _$$OrdersScreenStateReadyCopyWith<$Res> {
  __$$OrdersScreenStateReadyCopyWithImpl(_$OrdersScreenStateReady _value,
      $Res Function(_$OrdersScreenStateReady) _then)
      : super(_value, (v) => _then(v as _$OrdersScreenStateReady));

  @override
  _$OrdersScreenStateReady get _value =>
      super._value as _$OrdersScreenStateReady;

  @override
  $Res call({
    Object? orders = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$OrdersScreenStateReady(
      orders: orders == freezed
          ? _value._orders
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
      {final Map<int, List<OrderDTO>> orders = const <int, List<OrderDTO>>{},
      this.currentPage = 0,
      this.totalCount = 0})
      : _orders = orders;

  final Map<int, List<OrderDTO>> _orders;
  @override
  @JsonKey()
  Map<int, List<OrderDTO>> get orders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orders);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'OrdersScreenState.ready(orders: $orders, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersScreenStateReady &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$OrdersScreenStateReadyCopyWith<_$OrdersScreenStateReady> get copyWith =>
      __$$OrdersScreenStateReadyCopyWithImpl<_$OrdersScreenStateReady>(
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
      {final Map<int, List<OrderDTO>> orders,
      final int currentPage,
      final int totalCount}) = _$OrdersScreenStateReady;

  Map<int, List<OrderDTO>> get orders;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$OrdersScreenStateReadyCopyWith<_$OrdersScreenStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrdersScreenStateErrorCopyWith<$Res> {
  factory _$$OrdersScreenStateErrorCopyWith(_$OrdersScreenStateError value,
          $Res Function(_$OrdersScreenStateError) then) =
      __$$OrdersScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$OrdersScreenStateErrorCopyWithImpl<$Res>
    extends _$OrdersScreenStateCopyWithImpl<$Res>
    implements _$$OrdersScreenStateErrorCopyWith<$Res> {
  __$$OrdersScreenStateErrorCopyWithImpl(_$OrdersScreenStateError _value,
      $Res Function(_$OrdersScreenStateError) _then)
      : super(_value, (v) => _then(v as _$OrdersScreenStateError));

  @override
  _$OrdersScreenStateError get _value =>
      super._value as _$OrdersScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$OrdersScreenStateError(
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
            other is _$OrdersScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$OrdersScreenStateErrorCopyWith<_$OrdersScreenStateError> get copyWith =>
      __$$OrdersScreenStateErrorCopyWithImpl<_$OrdersScreenStateError>(
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
  const factory OrdersScreenStateError({required final String error}) =
      _$OrdersScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$OrdersScreenStateErrorCopyWith<_$OrdersScreenStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
